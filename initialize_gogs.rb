class InitializeGogs
  require "./file_actions"
  require "./gogs_actions"
  require 'git'

  #########################################################
  #YOU MUST CREATE THE EMPTY REPOSITORIES BY HAND
  #########################################################
  #Gogs reinitialize script

  @repository_name = "Java//TeamA"

  #delete and create source directory $repository_name

  fileActions = FileActions.new(@repository_name)
  fileActions.createDirectory

  #in source directory git init
  fileActions.git_init

  #copy master to source directory
  fileActions.copy_project

  #git add.  and commit
  fileActions.add_to_git

  #git remote add origin www.hxpads.com:8082:$repositoryName
  fileActions.remote_add

  #git push -u origin master
  fileActions.push
end