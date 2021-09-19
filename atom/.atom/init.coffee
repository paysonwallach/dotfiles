oldWindowDimensions = {}

atom.commands.add 'atom-workspace',
  'custom:screenshot-prep': ->
    oldWindowDimensions = atom.getWindowDimensions()
    atom.setWindowDimensions('width': 1366, 'height': 768)

  'custom:screenshot-restore': ->
    atom.setWindowDimensions(oldWindowDimensions)

  'custom:throw-error': ->
    throw new Error
