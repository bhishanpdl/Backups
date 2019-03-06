# Author: Bhishan Poudel
# Date: Sep 26, 2017
# File: Atom init.coffee
#


####### Make my snippets the first suggestion
# Ref: https://github.com/atom/autocomplete-plus/issues/785
consumeService = (packageName, providerName, fn) ->
  disposable = atom.packages.onDidActivatePackage (pack) ->
    if pack.name is packageName
      service = pack.mainModule[providerName]()
      fn(service)
      disposable.dispose()

consumeService 'autocomplete-snippets', 'provide', (provider) ->
  # You can try with bigger number if it won't solve your problem
  provider.constructor::suggestionPriority = 3




#################### Custom time ################
# 'atom-text-editor[data-grammar="source gfm"]':
#   'ctrl-shift-a': 'custom:insert-timestamp'
atom.commands.add 'atom-workspace',
  'custom:insert-timestamp': ->
    now = new Date()
    atom.workspace.getActiveTextEditor().insertText(now.toISOString().split('T')[0])


# Some init coffee commands collection
# https://discuss.atom.io/t/share-your-init-coffee/13945/2
path = require 'path'

oldWindowDimensions = {}

atom.commands.add 'atom-workspace',
  #=============================================================================
  # Todo list
  'custom:open-todo-list': ->
    todoList = path.join(process.env.HOME, 'Dropbox/todo/todo.txt')
    atom.workspace.open(todoList)
  #=============================================================================
  # Jedimaster
  'custom:open-jedisim': ->
    myvar = path.join(process.env.HOME, 'Research/a4_jedisim_v3.0_v3.0/jedisim.py')
    atom.workspace.open(myvar)
  'custom:open-jconf': ->
    myvar = path.join(process.env.HOME, 'Research/a4_jedisim_v3.0/physics_settings/config.sh')
    atom.workspace.open(myvar)
  'custom:open-runjedisim': ->
    myvar = path.join(process.env.HOME, 'Research/a4_jedisim_v3.0/run_jedisim.py')
    atom.workspace.open(myvar)
  #=============================================================================
  # Configuration Files
  'custom:open-bashrc': ->
    myvar = path.join(process.env.HOME, '.bash_profile')
    atom.workspace.open(myvar)
  'custom:open-vimrc': ->
    myvar = path.join(process.env.HOME, '.vimrc')
    atom.workspace.open(myvar)
  'custom:open-jnb-snippets': ->
    myvar = path.join(process.env.HOME, 'anaconda/share/jupyter/nbextensions/snippets/snippets.json')
    atom.workspace.open(myvar)
  #=============================================================================
  # Desktop Files Open
  'custom:open-template-py': ->
    myvar = path.join(process.env.HOME, 'Temp/a.py')
    atom.workspace.open(myvar)
  'custom:open-template-c': ->
    myvar = path.join(process.env.HOME, 'Temp/a.c')
    atom.workspace.open(myvar)
  'custom:open-template-md': ->
    myvar = path.join(process.env.HOME, 'Temp/a.md')
    atom.workspace.open(myvar)
  'custom:open-template-f': ->
    myvar = path.join(process.env.HOME, 'Temp/a.f90')
    atom.workspace.open(myvar)
  'custom:open-template-rst': ->
    myvar = path.join(process.env.HOME, 'Temp/a.rst')
    atom.workspace.open(myvar)
  'custom:open-template-txt': ->
    myvar = path.join(process.env.HOME, 'Temp/a.txt')
    atom.workspace.open(myvar)
  'custom:open-template-latex': ->
    myvar = path.join(process.env.HOME, 'Temp/mylatex/a.tex')
    atom.workspace.open(myvar)
  #=============================================================================
  # Prospectus
  'custom:open-pros': ->
    myvar = path.join(process.env.HOME, 'Dropbox/Prospectus/prospectus/prospectus.tex')
    atom.workspace.open(myvar)
  'custom:open-prosLog': ->
    myvar = path.join(process.env.HOME, 'Dropbox/Prospectus/prospectus/prospectus.log')
    atom.workspace.open(myvar)
  #=============================================================================
  # Screen Capture
  'custom:screenshot-prep': ->
    oldWindowDimensions = atom.getWindowDimensions()
    atom.setWindowDimensions('width': 1366, 'height': 768)
  'custom:screenshot-restore': ->
    atom.setWindowDimensions(oldWindowDimensions)

# Hide treeview sidebar by default
atom.packages.onDidActivateInitialPackages ->
  workspaceView = atom.views.getView(atom.workspace);
  atom.commands.dispatch(workspaceView, 'tree-view:toggle');
