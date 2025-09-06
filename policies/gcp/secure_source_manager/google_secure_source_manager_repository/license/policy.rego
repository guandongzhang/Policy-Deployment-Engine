package terraform.gcp.security.secure_source_manager.google_secure_source_manager_repository.license

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secure_source_manager.google_secure_source_manager_repository.vars

licenses := [
	"apache-2-0",
	"mit",
	"bsd-2-clause",
	"bsd-3-clause",
	"gpl-2-0-only",
	"gpl-2-0-or-later",
	"gpl-3-0-only",
	"gpl-3-0-or-later",
	"lgpl-2-1-only",
	"lgpl-2-1-or-later",
	"lgpl-3-0-only",
	"lgpl-3-0-or-later",
	"mpl-2-0",
	"epl-2-0",
	"agpl-3-0-only",
	"agpl-3-0-or-later",
	"cc0-1-0",
	"cc-by-4-0",
	"cc-by-sa-4-0",
	"artistic-2-0",
	"unlicense",
	"bsl-1-0",
	"osl-3-0",
	"isc",
	"cddl-1-0",
	"cddl-1-1",
	"eupl-1-2",
	"zlib",
	"wtfpl",
	"openssl",
]

conditions := [
	[
		{
			"situation_description": "Project must have a valid open-source license from the approved list",
			"remedies": ["Add a valid license from the approved list to your project"],
		},
		{
			"condition": "Check if the license is in the approved whitelist.",
			"attribute_path": ["initial_config", 0, "license"],
			"values": licenses,
			"policy_type": "whitelist",
		},
	],
	[
		{
			"situation_description": "A valid license must be specified for the project.",
			"remedies": ["Include a valid license in the configuration, and ensure the license field is not null."],
		},
		{
			"condition": "Ensure the license is not null and is part of the allowed licenses list",
			"attribute_path": ["initial_config", 0, "license"],
			"values": [null],
			"policy_type": "blacklist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
