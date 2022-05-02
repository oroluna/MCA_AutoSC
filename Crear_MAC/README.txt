Script "mac_files_config.py" generates new .mac files according to the metrics
set in the "config.json" file. This JSON files contains the following fields:

name = Name of the analyzed particle. I.e. "m+", "e-", "e+", etc.
specification = A list of specification IDs (string separated by commas).
    I.e. "01,02,03", "01", "spam,eggs", etc.
energy = Object with energy levels. Each key represents the level unit ("eV",
    "MeV", etc.) and its value is a list of the energy values (string
    separated by commas).
    I.e.
        "eV": "12,24,36"
        "MeV": "100,200,500"
simulations = Number of simulations to be run (integer).

This JSON file will be used to replace the placeholders in the "base.mac" file:

+-------------------------+------------------------------+
| Placeholder in base.mac |      Key in config.json      |
+-------------------------+------------------------------+
|        @particle        |            "name"            |
|      @energy_value      |           "energy"           |
|       @energy_unit      |        eV, MeV, etc.         |
|       @output_name      | Formatted name with metrics. |
|       @simulations      |        "simulations"         |
+-------------------------+------------------------------+

Generated files will be created in "resulting_mac_files" directory under the
current working directory.

Get more information running command:
python3 mac_files_config.py --help
