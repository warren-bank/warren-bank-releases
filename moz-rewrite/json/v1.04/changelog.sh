# https://coderwall.com/p/qkofma/a-caution-about-git-branch-names-with-s
# http://stackoverflow.com/questions/2527355/using-the-slash-character-in-git-branch-name/2527452#2527452

# new branch: `json/master`
git checkout c190f3a0f11d8cbfa7434323e7cbea3738892872      # v1.01
git checkout -b json/master
git push origin json/master

# new branch: `js/eval/master`
git checkout master                                        # 5844680e78ec2bc6856b5eb7fb30bd80b1b2636d
git checkout -b js/eval/master
git push origin js/eval/master

# new branch: `js/Cu.evalInSandbox/master`
git checkout -b js/Cu.evalInSandbox/master
git push origin js/Cu.evalInSandbox/master

# rename branch: `js/eval/replay/curl`
git checkout replay/curl                                   # 32cb77021d295c8e037381cd6e85df52f9c0f236
git checkout -b js/eval/replay/curl
git push origin js/eval/replay/curl
git branch -D replay/curl
git push --delete origin replay/curl

# rename branch: `js/data/recipe-book`
git checkout data/recipe-book                              # 97b9dfeaefa9b3861790743e046db9e835b324f1
git checkout -b js/data/recipe-book
git push origin js/data/recipe-book
git branch -D data/recipe-book
git push --delete origin data/recipe-book

# new branch: `json/data/recipe-book`
git checkout --orphan json/data/recipe-book
git rm -rf .
git add --all .
git commit --allow-empty -m'placeholder'
git push origin json/data/recipe-book

# delete branch: `master`
git checkout js/Cu.evalInSandbox/master
git update-ref HEAD js/Cu.evalInSandbox/master
git remote set-head origin js/Cu.evalInSandbox/master
git branch -D master
# https://github.com/warren-bank/moz-rewrite/settings
# change "default branch" to: `js/Cu.evalInSandbox/master`
git push --delete origin master

# rename tags
git tag js/eval/v2.05 v2.05                                # 810924371d7034e2b1b79b99c1ed174548bf8441
# git show v2.05
# git show js/eval/v2.05
git tag js/eval/v2.04 v2.04                                # 3170c29647f5c42919b2d8b8037463291d81e280
git tag js/eval/v2.03 v2.03                                # 7e37853e5cc601887e5180022d566a84d5044c3d
git tag js/eval/v2.02 v2.02                                # ace4d57430d60cca06af73a55d2c019308cac99f
git tag js/eval/v2.01 v2.01                                # 7ea64debc9883d355aeca311da603ca5ef0ee996
git tag js/eval/v2.00 v2.00                                # 9059193cceae1a96658d1cfda7b948cf11e37110
git tag js/eval/v1.01 v1.01                                # c190f3a0f11d8cbfa7434323e7cbea3738892872
git tag js/eval/v1.00 v1.00                                # b450c839c7a1595ab2b94742b04451deb2fef53a
git push --tags

# edit releases on github, reassociate each to its new corresponding tag name

# delete old tags
git tag -d v2.05
git tag -d v2.04
git tag -d v2.03
git tag -d v2.02
git tag -d v2.01
git tag -d v2.00
git tag -d v1.01
git tag -d v1.00
git push --delete origin v2.05
git push --delete origin v2.04
git push --delete origin v2.03
git push --delete origin v2.02
git push --delete origin v2.01
git push --delete origin v2.00
git push --delete origin v1.01
git push --delete origin v1.00
git push --tags

# migrate commits from `moz-rewrite-amo` into branch `json/master`
git checkout json/master
# delete all files from working directory
# copy all files from the working directory (post-checkout) of a secondary git repo
git add --all .
git commit -m'[v1.00] initial commit'
git tag json/v1.00
git push origin json/master
git push --tags
# on github, add a new release for tag `json/v1.00`
# repeat for all releases..
