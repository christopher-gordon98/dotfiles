sed -i 's/pattern/replacement/' <files>
ind . -name *.cpp | xargs sed -i 's/pattern/replacement/'
grep -rl 'pattern1' | xargs sed -i 's/pattern2/replacement/'
ack -l 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'

