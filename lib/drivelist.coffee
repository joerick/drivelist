os = require('os')

win32 = require('./win32')
darwin = require('./darwin')
linux = require('./linux')

getOSModule = ->
	operatingSystem = os.platform()

	switch operatingSystem
		when 'darwin' then darwin
		when 'win32' then win32
		when 'linux' then linux
		else
			throw new Error("Your OS is not supported by this module: #{operatingSystem}")

exports.list = (callback) ->
	getOSModule().list(callback)

exports.isSystem = (drive, callback) ->
	getOSModule().isSystem(drive, callback)
