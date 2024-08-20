dart .\adf_cli.dart -h
    dart .\adf_cli.dart students -h
        dart .\adf_cli.dart students findAll
        dart .\adf_cli.dart students findById -i 1
        dart .\adf_cli.dart students delete -i 1
        dart .\adf_cli.dart students insert -f ..\csv_files\insert.csv
        dart .\adf_cli.dart students update -i 0 -f ..\csv_files\update.csv