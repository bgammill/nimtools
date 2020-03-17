for i in `find . -name "*.nim" -type f`; do
    nim c -d:ssl -d:release "${i}"
done
