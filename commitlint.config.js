module.exports = {
	extends: ['@commitlint/config-conventional'],
	parserPreset: {
		parserOpts: {
			issuePrefixes: ['#'],
		},
	},
	rules: {
		'references-empty': [2, 'always'], // Validate for issue/ticket numbers
		'header-case': [2, 'always', 'lower-case'],
		'scope-case': [2, 'always', 'lower-case'],
		'subject-case': [2, 'always', ['lower-case']],
	},
}
