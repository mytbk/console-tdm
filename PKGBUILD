# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A session selector similar to CDM."
url=http://linux.bdwm.net
arch=('any')
pkgver=0.2.1
pkgrel=2
license=('GPL')
depends=('xorg-xinit')
source=('tdm')
install=tdm.install

build() {
	true
}

package(){
	mkdir -p $pkgdir/usr/bin
	cd $srcdir
	cp tdm $pkgdir/usr/bin/
	chmod +x $pkgdir/usr/bin/tdm
}

md5sums=("f1f1735e1f39567fd2f1e06cd5459f2e")
