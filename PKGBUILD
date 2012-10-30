# Maintainer: Iru Dog <mytbk920423@gmail.com>

pkgname=console-tdm
pkgdesc="A session selector similar to CDM."
url=http://linux.bdwm.net
arch=('any')
pkgver=0.2.1
pkgrel=2
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
"6e21a89fb950132345808ea920d2035f"
"34fde89e0455e97c8843cdbddcd6a5da"
)
