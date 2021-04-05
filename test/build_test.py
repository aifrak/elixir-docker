import os
import pytest
import testinfra

# versions used in Dockerfile
ELIXIR_VERSION = '1.11.3'
ERLANG_VERSION = '23.2.7'

HOME_PATH = os.environ['HOME']
USER_NAME = 'app-user'
USER_GROUP = 'www-data'


@pytest.mark.parametrize('name,version', [
    ('elixir', ELIXIR_VERSION),
])
def test_custom_packages(host, name, version):
    version_cmd = host.run(name + ' --version')

    assert version_cmd.succeeded
    if version:
        assert version in version_cmd.stdout


def test_erlang_package(host):
    version_cmd = host.run(
        "erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), \"releases\", erlang:system_info(otp_release), \"OTP_VERSION\"])), io:fwrite(Version), halt().' -noshell")

    assert version_cmd.succeeded
    assert version_cmd.stdout.startswith(ERLANG_VERSION)


def test_current_user(host):
    user = host.user()

    assert user.name == USER_NAME
    assert user.group == USER_GROUP


def test_home_directory(host):
    assert HOME_PATH == '/home/' + USER_NAME
