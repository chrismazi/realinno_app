import random

LANGS = ["en", "sw"]
# Top-level map by language code
en = dict(
    MAIN_MENU = (
        "Welcome!\n1. Mental Health Support\n2. Financial Literacy\n3. Request Tips via SMS\n4. Helpline/Support Info\n#. Language/Change Language"
    ),
    MH_MENU = (
        "Mental Health Support:\n1. Coping Strategy\n2. Mindfulness Exercise\n3. Speak to a Counsellor\n0. Back"
    ),
    FL_MENU = (
        "Financial Literacy:\n1. Savings Tips\n2. Budgeting 101\n3. Small Business Ideas\n0. Back"
    ),
    SUPPORT_INFO = (
        "Helpline: 123-456-HELP\nYou are not alone! For urgent support, dial national helpline.\n0. Back"
    ),
    MH_COPING_STRATEGIES = [
        "Take slow, deep breaths. Try a short walk and notice your surroundings.",
        "Pause and chat with a friend or trusted person. Even a short talk helps.",
    ],
    MH_MINDFULNESS = [
        "Focus on 5 things you can see. Say them out loud.",
        "Sit still; notice the feeling of your feet touching the ground.",
    ],
    FL_SAVINGS_TIPS = [
        "Save a small amount regularly. Even coins add up over time!",
        "Record every expense for a week—you’ll see where your savings can start.",
    ],
    FL_BUDGETING = [
        "Write down all money in/out. Review weekly to plan ahead.",
        "Plan tomorrow’s small purchases tonight. Set a limit—stick to it!",
    ],
    FL_SMALL_BIZ = [
        "Start small: sell food or basic items from home.",
        "Team up with friends for group selling or farming to split costs.",
    ],
)

sw = dict(
    MAIN_MENU = (
        "Karibu!\n1. Usaidizi wa Afya ya Akili\n2. Elimu ya Fedha\n3. Omba Ushauri kwa SMS\n4. Nambari ya Msaada\n#. Badilisha Lugha (Change Language)"
    ),
    MH_MENU = (
        "Afya ya Akili:\n1. Njia ya Kukabiliana\n2. Mazoezi ya Utulivu\n3. Ongea na Mshauri\n0. Rudi Nyuma"
    ),
    FL_MENU = (
        "Elimu ya Fedha:\n1. Vidokezo vya Akiba\n2. Bajeti 101\n3. Biashara Ndogo Ndogo\n0. Rudi Nyuma"
    ),
    SUPPORT_INFO = (
        "Nambari ya Msaada: 123-456-HELP\nHauko peke yako! Kwa msaada wa haraka, piga nambari ya taifa.\n0. Rudi Nyuma"
    ),
    MH_COPING_STRATEGIES = [
        "Pumua taratibu. Tembea kidogo uangalie mazingira yako.",
        "Zungumza na rafiki au mtu unayemuamini. Hata mazungumzo mfupi yanasaidia.",
    ],
    MH_MINDFULNESS = [
        "Taja vitu 5 unavyoona sasa hivi. Vitamke kwa sauti.",
        "Kaa kimya; hisi miguu yako ikiwa chini ya ardhi.",
    ],
    FL_SAVINGS_TIPS = [
        "Hifadhi pesa kidogo mara kwa mara. Hata sarafu ndogo huongezeka!",
        "Andika kila matumizi kwa wiki—utaona wapi unaweza kuanza kuweka akiba.",
    ],
    FL_BUDGETING = [
        "Andika mapato na matumizi yote. Kagua kila wiki kupanga vizuri kesho.",
        "Panga manunuzi madogo ya kesho leo. Weka kikomo—kishike!",
    ],
    FL_SMALL_BIZ = [
        "Anza kidogo: uza chakula au bidhaa muhimu nyumbani.",
        "Ungana na rafiki kwa biashara ya pamoja kupunguza gharama.",
    ],
)

LANG_MAP = {'en': en, 'sw': sw}

def pick_random_message(options):
    return random.choice(options)
