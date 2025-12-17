source ./dev/start

make unit

pytest --cov -m "not integration" conda tests

pytest --cov tests/test_create.py -k create_install_update_remove_smoketest
