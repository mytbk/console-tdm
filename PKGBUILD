# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A session selector similar to CDM."
url=http://linux.bdwm.net
arch=('any')
pkgver=0.2.2
pkgrel=1
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
"e0fc6c2f95e5cec9d06c4e6e8638a8bc"
"34fde89e0455e97c8843cdbddcd6a5da"
)
