class FileActions

  require 'fileutils'
  require 'git'

  def initialize(repository_name)
    @path = "//Users//chetHendrickson//Temp//" + repository_name
    @source = "//Users//chetHendrickson//Dropbox/ADS Server Files/Master/."
  end

  def createDirectory
    puts @path
    puts Dir.exists? @path

    if Dir.exists? @path
      FileUtils.rm_rf @path
    end

    puts Dir.exists? @path

    Dir.mkdir @path

    puts Dir.exists? @path
  end

  def git_init
    puts "init"
    Dir.chdir @path
    Git.init
    @git = Git.open @path, :log => Logger.new(STDOUT)
  end

  def copy_project
    FileUtils.cp_r @source, @path
  end
  
  def add_to_git
    @git.add
    @git.commit "Added " + Date.today.to_s
    puts "add to git"
  end

  def remote_add
    uri = URI "http://chet:extreme@localhost:8082/chet/Team1.git"
      @git.add_remote "master", uri
      puts "remote add"
  end

  def push
    @git.push(@git.remote "master")
    puts "push"
  end
end