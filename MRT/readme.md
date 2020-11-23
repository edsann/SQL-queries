# MRT queries

* `MRT_Export-WinattIDfull` retrieves stampings in WinattID format, specifying the time period; parameters are read from T103COMPARAMS and T25COMBADGE
* `MRT_Export-WinattIDsimple` retrieves stampings in WinattID format, parameters are set to default
* `MRT_Get-CumulatedAttendancesInPeriod` returns the total amount of people entered in a specific time period
* `MRT_Get-EnabledOnGates` returns the total amount of people enabled on a specific range of gates
* `MRT_Get-PlantStatus` performs a series of analysis queries to get characteristics of the current installation
* `MRT_New-DatabaseBackup` performs a backup of the MRT database
* `MRT-New-DatabaseRestore` performs a restore of the MRT database
* `MRT-Select-EmployeesBadge-ColoreQualifica` is a badge logical view with configurable fields (Colore,Qualifica)
* `MRT_Select-EmployeesBadge-LayoutQualifica` is a badge logical view with configurable fields (Layout,Qualifica)
* `MRT_Select-Guests-DocsNotes` returns the incoming guests with the corresponding documentation and notes fields
* `MRT_Select-MonthlyPeopleAverage` returns the average amount of people, divided into categories, for each day of the month and for the whole month
* `MRT_Select-ReportsAuthorizations` returns the authorization of each user on a specific report
* `MRT_Test-EmailNotifier` performs a series of queries to troubleshoot the email notifier procedure
