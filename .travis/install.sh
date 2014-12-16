#!/bin/sh

run_lines(){
    while read line; do echo "$line"; sh -c "$line" || exit $?; done
}

case "$TEST_MODE"
in
    run_tests)
        run_lines<<'EOF'
        if [ $TRAVIS_PYTHON_VERSION = "2.6" ]; then pip install unittest2; fi
        pip install werkzeug
        python setup.py install
EOF
        ;;
    coverage)
        run_lines<<'EOF'
        pip install coveralls
        pip install werkzeug
        python setup.py install
EOF
        ;;
    check_style)
        pip install flake8
        ;;
esac
