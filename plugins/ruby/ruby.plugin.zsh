# ¤ruby
#RUBY_VERSION="1.9.1"
#export RUBY_LIB="/usr/lib/ruby/$RUBY_VERSION"  # user-defined 
#export RUBY_SITELIB="/usr/lib/ruby/site_ruby/$RUBY_VERSION" # user-defined
export RUBYOPT="-Ku -r/usr/lib/ruby/gems/1.9.1/gems/pd-1.0.1/lib/pd.rb" # for ruby1.8 support.  ruby1.9 "-r pd".
#export RUBYLIB="" # require


# TODO: Make this compatible with rvm.
#       Run sudo gem on the system ruby, not the active ruby.
alias sgem='sudo gem'

# Find ruby file
alias rfind='find . -name *.rb | xargs grep -n'
