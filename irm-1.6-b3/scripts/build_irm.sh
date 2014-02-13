#!/bin/sh



BUILDDIR=$( mktemp -d )
VER="$1"

if [ -z "$VER" ]; then
	echo "You must specify a version to build_irm.sh!"
	exit 1
fi

DESTDIR="$BUILDDIR/irm-$VER"
TARBALL="irm-$VER.tar.gz"

mkdir $DESTDIR

cp -a config database docs include images styles javascript lib locale users $DESTDIR

cp README admin.php index.php login.php $DESTDIR

pushd $DESTDIR

cd locale
./xlat.sh
cd ..

# Clear out crap from subdirectories which we don't want
rm -rf docs/historic_db docs/api locale/xlat.sh locale/fuzzfactor
rm -f config/*.ini

# Clean out all of the CVS and Arch internal directories
rm -rf $( find . -name CVS )
rm -rf $( find . -name .arch-ids -or -name .arch-inventory )

# Replace all instances of the special macro 1.6-b3 with the specific
# version we're building
for file in $( grep -rl '1.6-b3' * ); do
	sed "s/1.6-b3/$VER/g" $file > $file.post
	mv $file.post $file
done

cd ..

tar czf $TARBALL irm-$VER

popd

mv $BUILDDIR/$TARBALL ..

rm -rf $BUILDDIR
