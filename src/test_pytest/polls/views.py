from django.http import HttpResponse


def index(request):
    from polls.models import Question
    required_id = request.GET.get('id', 1)
    question = Question.objects.get(id=int(required_id))
    return HttpResponse("{}".format(question.question_text))
