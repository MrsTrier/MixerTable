//
//  MixerTableView.swift
//  MixerTable
//
//  Created by Daria Cheremina on 10/11/2024.
//

import UIKit

class MixerTableView: UITableView {
    var mixerTableRows: [MixerTableRow] = MixerTableRow.rows

    private var snapshot = NSDiffableDataSourceSnapshot<MixerTableSection, MixerTableRow>()

    private lazy var mixerTableDataSource = MixerTableDataSource(tableView: self)

    override init (frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.register(UITableViewCell.self, forCellReuseIdentifier: "MixerTableCell")
        applySnapshot()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func applySnapshot() {
        snapshot.appendSections([.main])
        snapshot.appendItems(mixerTableRows, toSection: .main)

        mixerTableDataSource.apply(snapshot, animatingDifferences: true)
    }

    func shuffleCells() {
        snapshot = NSDiffableDataSourceSnapshot<MixerTableSection, MixerTableRow>()

        mixerTableRows.shuffle()
        snapshot.appendSections([.main])
        snapshot.appendItems(mixerTableRows, toSection: .main)

        mixerTableDataSource.apply(snapshot, animatingDifferences: true)
    }
}

//MARK: - UITableViewDelegate
extension MixerTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = mixerTableDataSource.itemIdentifier(for: indexPath) else { return }

        if item.flag == false {
            mixerTableRows[indexPath.row].flag = true

            let element = mixerTableRows.remove(at: indexPath.row)

            mixerTableRows.insert(element, at: 0)

            applySnapshotWithAnimationAndReplace(item: item, with: element, indexPath: indexPath)
        } else {
            mixerTableRows[indexPath.row].flag = false
            let element = mixerTableRows[indexPath.row]

            applySnapshotAndReplace(item: item, with: element, indexPath: indexPath)
        }
    }

    private func applySnapshotWithAnimationAndReplace(item: MixerTableRow, with element: MixerTableRow, indexPath: IndexPath) {
        snapshot.deleteItems([item])

        if indexPath.row == 0 {
            guard let next = mixerTableDataSource.itemIdentifier(for: IndexPath(row: indexPath.row + 1, section: 0)) else { return }
            snapshot.insertItems([element], beforeItem: next)
            mixerTableDataSource.apply(snapshot, animatingDifferences: false)
        } else {
            guard let firstItem = mixerTableDataSource.itemIdentifier(for: IndexPath(row: 0, section: 0)) else { return }

            snapshot.insertItems([element], beforeItem: firstItem)
            mixerTableDataSource.apply(snapshot, animatingDifferences: true)
        }
    }

    private func applySnapshotAndReplace(item: MixerTableRow, with element: MixerTableRow, indexPath: IndexPath) {
        if indexPath.row < mixerTableRows.count - 1 {
            guard let next = mixerTableDataSource.itemIdentifier(for: IndexPath(row: indexPath.row + 1, section: 0)) else { return }

            snapshot.deleteItems([item])
            snapshot.insertItems([element], beforeItem: next)
        } else {
            snapshot.deleteItems([item])
            snapshot.appendItems([element])
        }

        mixerTableDataSource.apply(snapshot, animatingDifferences: false)
    }
}
