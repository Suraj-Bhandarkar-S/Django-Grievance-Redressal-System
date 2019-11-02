from django.apps import AppConfig
from suit.apps import DjangoSuitConfig

class SuitConfig(DjangoSuitConfig):
    layout='vertical'
class GrsystemConfig(AppConfig):
    name = 'GRsystem'
    
