# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A session selector similar to CDM."
url=https://code.google.com/p/t-display-manager/
arch=('any')
pkgver=0.2.2
pkgrel=3
license=('GPL')
depends=('xorg-xinit')
source=('tdm' 'tdmtree.tar.gz')
install=tdm.install

build() {
	true
}

package(){
	mkdir -p $pkgdir/usr/bin
	cd $srcdir
	cp tdm $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin/tdm
	cp -Rv usr $pkgdir/
}

md5sums=(
"196effa7a0f2bdb28126e9ff422d2080"
"34fde89e0455e97c8843cdbddcd6a5da"
)
