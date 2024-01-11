animation_a() {
    S="\033[s"
    U="\033[u"

    # Position of column
    # 15ta col -> 14C
    # 3er  col ->  2C
    POS="\033[1000D\033[2C"

    while [ : ]
    do
         sleep 0.3
         eval echo -ne '${S}${POS}\>\ \ ${U}'
         sleep 0.3
         eval echo -ne '${S}${POS}\ \>\ ${U}'
         sleep 0.3
         eval echo -ne '${S}${POS}\ \ \>${U}'
         sleep 0.3
    done
}

animation_b() {
    S="\033[s"
    U="\033[u"

    POS="\033[1000D\033[2C"
    while [ : ]
    do
         sleep 0.3
         eval echo -ne '${S}${POS}\>\ \ ${U}'
         sleep 0.3
         eval echo -ne '${S}${POS}\ \>\ ${U}'
         sleep 0.3
         eval echo -ne '${S}${POS}\ \ \>${U}'
         sleep 0.6
         eval echo -ne '${S}${POS}\ \ \<${U}'
         sleep 0.3
         eval echo -ne '${S}${POS}\ \<\ ${U}'
         sleep 0.3
         eval echo -ne '${S}${POS}\<\ \ ${U}'
         sleep 0.3
    done
}


alias ANIMATION=animation_a

export PS1="......"
ANIMATION &
