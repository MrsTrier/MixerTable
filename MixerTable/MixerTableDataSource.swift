//
//  MixerTableDataSource.swift
//  MixerTable
//
//  Created by Daria Cheremina on 10/11/2024.
//

import UIKit

class MixerTableDataSource: UITableViewDiffableDataSource<MixerTableSection, MixerTableRow> {
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MixerTableCell",
                                                     for: indexPath)
            var content = cell.defaultContentConfiguration()

            content.text = itemIdentifier.name

            cell.accessoryType = .none

            if itemIdentifier.flag == true {
                cell.accessoryType = .checkmark
            }
            
            cell.contentConfiguration = content
            return cell
        }
    }
}
