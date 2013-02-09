#
#            ___     -._
#            `-. """--._ `-.
#               `.      "-. `.
# _____           `.       `. \       
#`-.   """---.._    \        `.\
#   `-.         "-.  \         `\
#      `.          `-.\          \_.-""""""""--._
#        `.           `                          "-.
#          `.                                       `.    __....-------...
#--..._      \                                       `--"""""""""""---..._
#__...._"_-.. \                       _,                             _..-""
#`-.      """--`           /       ,-'/|     ,                   _.-"
#   `-.                 , /|     ,'  / |   ,'|    ,|        _..-"
#      `.              /|| |    /   / |  ,'  |  ,' /        ----"""""""""_`-
#        `.            ( \  \      |  | /   | ,'  //                 _.-"
#          `.        .'-\/'""\ |  '  | /  .-/'"`\' //            _.-"
#    /'`.____`-.  ,'"\  ''''?-.V`.   |/ .'..-P''''  /"`.     _.-"
#   '(   `.-._""  ||(?|    /'   >.\  ' /.<   `\    |P)||_..-"___.....---
#     `.   `. "-._ \ ('   |     `8      8'     |   `) /"""""    _".""
#       `.   `.   `.`.b|   `.__            __.'   |d.'  __...--""
#         `.   `.   ".`-  .---      ,-.     ---.  -'.-""
#           `.   `.   ""|      -._      _.-      |""
#             `.  .-"`.  `.       `""""'       ,'
#               `/     `.. ""--..__    __..--""
#                `.      /7.--|    """"    |--.__
#                  ..--"| (  /'            `\  ` ""--..
#               .-"      \\  |""--.    .--""|          "-.
#              <.         \\  `.    -.    ,'       ,'     >
#             (P'`.        `%,  `.      ,'        /,' .-"'?)
#             P    `. \      `%,  `.  ,'         /' .'     \
#            | --"  _\||       `%,  `'          /.-'   .    )
#            |       `-.""--..   `%..--"""\\"--.'       "-  |
#            \          `.  .--"""  "\.\.\ \\.'       )     |
#

# Update kits
function ku() {
 pushd ~/.kit
 rm -Rf packages
 git pull
 popd
}

# Find a project in various directories. Change them to whatever suits you
function fp() {
 echo `find $HOME/Projects/mogeneration $HOME/Projects/mogeneration/oomph-build $HOME/Projects/Personal $HOME/Projects/OpenSource -maxdepth 1 | grep /\[\^/\]\*$1\
\[\^/\]\*$ | head -n 1`
}

# Go to a particular project
function go () {
 local PROJECT=`fp $1`

 if [ -n "$PROJECT" ]
 then
   cd "$PROJECT"
 else
   echo "There is no project like:" $1
 fi
}

# Update a particular project
function gu() {
 if [ -n "$1" ]
 then
   local PROJECT=`fp $1`
 else
   local PROJECT=`pwd`
 fi

 if [ -n "$PROJECT" ]
 then
   cd "$PROJECT"
 fi

 git pull
 kit update
}

# Update everything
function goku() {
 if [ -n "$1" ]
 then
   local PROJECT=`fp $1`
 else
   goku $(basename $(pwd))
   return
 fi

 echo "\nUpdating Kits..."
 ku

 if [ -n "$PROJECT" ]
 then
   if [ -n `ls "$PROJECT" | grep dev-packages` ]
   then
     for package in `ls "$PROJECT"/dev-packages`
     do
       echo "\nUpdating $package..."
       gu "$package"
     done
   fi
 fi

 echo "\nUpdating $PROJECT..."
 gu `basename "$PROJECT"`
}
