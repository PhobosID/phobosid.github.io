all :
	@echo "menu : make init"
	@echo "menu : make root"
	@echo "menu : make diff"
	@echo "menu : make sign"
	@echo "menu : make vrfy"
	@echo "menu : make commit"
	@echo "menu : make undo"

root :
	svn up
	perl mk-root -v

diff :
	svn diff ROOT

sign :
	@echo "signing with your default-key ..."
	gpg --verify ROOT.asc ROOT || gpg -a -b ROOT

vrfy :
	@if test ! -f ROOT.asc ;\
        then echo 'no ROOT.asc ; use : make sign' ; false ;\
        fi
	gpg --verify ROOT.asc ROOT

commit : vrfy
	svn commit -m 'fresh root' ROOT ROOT.asc

undo :
	rm -f ROOT ROOT.asc ; svn up

init :
	perl etc/init.pl

fix : README.html

README.html : etc/readme.pl README
	perl etc/readme.pl