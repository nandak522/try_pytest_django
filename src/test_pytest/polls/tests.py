from django.test import TestCase
from django.test import Client
import pytest


class TestClassic(TestCase):

    def test_polls_index(self):
        client = Client()
        response = client.get('/polls/?id=1')
        assert response.status_code == 200
        assert b'How' in response.content

@pytest.fixture(scope='session')
def django_db_setup():
    from django.conf import settings
    settings.DATABASES['default']['TEST'] = {
        'NAME': settings.DATABASES['default']['NAME']
    }
    settings.DATABASES['default'].update({
        'OPTIONS': {
            'init_command': 'SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED'
        }
    })

@pytest.fixture
def latest_question_id():
    from polls.models import Question
    yield Question.objects.latest('id').id


@pytest.mark.django_db
def test_pytest():
    client = Client()
    response = client.get('/polls/?id=1')
    assert response.status_code == 200
    assert b'How' in response.content


@pytest.mark.django_db
def test_pytest_db_access_from_test():
    client = Client()
    response = client.get('/polls/?id=1')
    from polls.models import Question
    question = Question.objects.latest('id')
    assert response.status_code == 200
    assert response.content.decode("utf-8") == question.question_text


@pytest.mark.django_db
def test_pytest_db_access_from_test_for_latest_question_id(latest_question_id):
    client = Client()
    response = client.get('/polls/?id={}'.format(latest_question_id))
    from polls.models import Question
    question = Question.objects.latest('id')
    assert response.status_code == 200
    assert response.content.decode("utf-8") == question.question_text
