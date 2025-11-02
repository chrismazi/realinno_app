import random

LANGS = ["rw", "en", "sw"]

rw = dict(
    ABOUT = (
        "Twite ku Buzima n’Imibereho - Real Works\n\n"
        "Mission: Gutegurira urubyiruko ruri mu kazi ubumenyi bw’ubuzima, imitekerereze, no gucunga ibyabo kugira ngo barusheho kuba abakozi b’indashyikirwa mu mibereho yabo yose.\n\n"
    ),
    MAIN_MENU = (
        "1. Ubuzima bwo mu mutwe n’imibereho myiza\n2. Ubumenyi bw’imari\n3. Umutekano n’ubumenyi bw’ubuzima\n4. Ubufasha n’amakuru\n5. FAQ/Ikibazo\n6. Sohoka\n#. Hindura ururimi (Change Language)"
    ),
    MH_MENU = (
        "Ubuzima bwo mu mutwe n’imibereho myiza:\n1. Guhangana n’umunaniro\n2. Guhangana n’agahinda/ubwoba\n3. Kwiyubakamo icyizere\n4. Imibanire myiza n’abandi\n0. Garuka"
    ),
    MH_STRESS = [
        "Akazi k’ubucukuzi karimo igitutu. Niba wumva uremerewe: Humeka buhoro kandi wihangane. Ganiriza inshuti cyangwa umuyobozi ukizeye. Fata akaruhuko gake niba bishoboka.",
        "Niba umunaniro ukomeje igihe kirekire, saba ubufasha ku ivuriro cyangwa ku mutoza w’ubuzima.",
        "Gerageza kurangiza akazi gahari, wibuke ko gusaba ubufasha atari intege nke.",
        "Shaka ahantu hatuje, utege amatwi uko umutima wawe utera, bigabanya igitutu."
    ],
    MH_LOSS_FEAR = [
        "Kubura inshuti cyangwa kugira ubwoba bwo kujya mu mwobo ni ibintu bibabaza. Nturi wenyine. Sangira amarangamutima yawe n’abandi, kwihisha bituma ubabara cyane.",
        "Kwumva ubwoba si intege nke, ni ikimenyetso cy’uko ukunda ubuzima. Dufashanye, hamwe turushaho gukomera.",
        "Gira umuntu ukurera icyizere ubwira amarangamutima yawe, biragufasha.",
        "Kora imyitozo ngufi yo guhumeka, uzasubirana icyizere."
    ],
    MH_CONFIDENCE = [
        "Kwiyubakamo icyizere kizana imbaraga. Ishimire ibyo wagezeho buri munsi, n’ibyoroheje. Wige ubumenyi bushya mu mutekano no mu mibereho.",
        "Wibwire uti 'Ndi umuntu w’agaciro kandi mfite icyizere.'",
        "Kubana n’abandi neza, no gufata ingamba zo kwiyitaho bizamura icyizere.",
        "Shyiraho intego zoroheje, uzageze kuri byinshi gahoro gahoro."
    ],
    MH_RELATIONSHIPS = [
        "Kubahana bitanga ituze. Vuga oya ku ihohoterwa cyangwa igitutu cy’imibonano mpuzabitsina.",
        "Fata buri muntu mu cyubahiro, yaba umugabo cyangwa umugore. Niba wahohotewe, ushobora kubimenyesha mu ibanga (reba 4 muri menu nyamukuru).",
        "Menya ko buri wese afite igiciro. Vuga uti: Mbanze mu cyubahiro n’amahoro.",
        "Gira inshuti, ntugategereze kuvuga gusa mu bibazo; no mu byiza bibuke kubashimira."
    ],
    FL_MENU = (
        "Ubumenyi bw’imari:\n1. Kuzigama neza\n2. Gukora ingengo y’imari\n3. Kumenya inguzanyo za SACCO\n4. Kwirinda imyenda mibi\n0. Garuka"
    ),
    FL_SAVINGS = [
        "Buri gihe gerageza kuzigama n’ubwo ari make. Koresha cyangwa ujye muri Umurenge SACCO.",
        "Kuzigama biguha amahoro n’umutekano igihe ubona make.",
        "Fata gahunda, shyiraho intego ku mafaranga uzigama buri cyumweru.",
        "Ibuka: amafaranga make azamuka buhoro buhoro, genda utibeshya ngo ni make."
    ],
    FL_BUDGETING = [
        "Tandukanya ibyo ukeneye n’ibyo ushaka gusa. Andika uko ukoresha amafaranga buri cyumweru.",
        "Teganyiriza ubuzima, umuryango n’ibibazo byihutirwa. Ingengo y’imari ni urufunguzo rw’ubwigenge.",
        "Imikoreshereze myiza y’amafaranga ituma wirinda guhomba no kugira imyenda myinshi.",
        "Igenamigambi rigira uruhare runini mu kubungabunga imibereho myiza."
    ],
    FL_LOANS = [
        "Umurenge SACCO itanga inguzanyo ishingiye ku byo wizigamye n’amateka yawe meza. Zigama buri gihe. Ishyura neza igihe cyagenwe.",
        "Inguzanyo nziza yagufasha gutera imbere, si iyo kukuzanira umutwaro.",
        "Fata inguzanyo gusa kuri gahunda ifite inyungu, wirinde kwishyura birengeje ubushobozi.",
        "SACCO ni umufatanyabikorwa mwiza; umenye amategeko n’amabwiriza mbere yo gufata inguzanyo."
    ],
    FL_DEBT = [
        "Wirinde kuguza amafaranga ngo ugure ibintu bitihutirwa. Niba ukeneye kuguza, jya mu kigo cyemewe, si mu bantu batizewe.",
        "Wibuke: umucukuzi w’inyabwenge ateganya mbere yo gukoresha.",
        "Imyenda mibi yuzana ingorane; fata ibyemezo byiza mbere yo kwiyemeza kuguza.",
        "Ujye ubanza witekerezeho mbere yo gusaba ideni; ese urabishoboye?"
    ],
    SAFETY_MENU = (
        "Umutekano n’ubumenyi bw’ubuzima:\n1. Imyitwarire yizewe\n2. Gukorera hamwe\n3. Uburyo bwo kuvugana neza\n4. Gutegura intego z’ubuzima\n0. Garuka"
    ),
    SAFETY_BEHAVIOR = [
        "Wambara ibikoresho by’umutekano buri gihe. Menyesha abayobozi ahantu hatari heza.",
        "Ntukajye mu mwobo wenyine. Umutekano si ubwoba, ni imbaraga.",
        "Girira ubushishozi mugenzi wawe: niba abonye icyago, mumufashe, mwitume.",
        "Irinde gukora nta gukurikiza amabwiriza y’umutekano."
    ],
    SAFETY_TEAMWORK = [
        "Kubahana no gukorera hamwe bitanga umutekano. Rindira bagenzi bawe.",
        "Fasha abashya mu kazi. Hamwe turaramba, hamwe turatera imbere.",
        "Kora nk’itsinda, musabane mu nzira y’iterambere.",
        "Urugwiro mu kazi rutuma buri wese yumva ari ingenzi."
    ],
    SAFETY_COMMUNICATION = [
        "Kuvugana neza bigabanya amakimbirane. Tegera neza mbere yo gusubiza. Vuga utuje kandi wubaha.",
        "Shima ibyo abandi bakoze.",
        "Itaho igihe cyo kumva mugenzi wawe mbere yo kumuha igisubizo.",
        "Niba hari ibikugoye, vugisha ukuri ariko wubahiriza icyubahiro."
    ],
    SAFETY_GOALS = [
        "Teganya ejo hawe hazaza. Ni iki ushaka kugeraho mu mwaka umwe?", 
        "Andika intego zawe, kandi buri cyumweru fata intambwe nto.",
        "Shaka inshuti yo kukurikirana mu ntego zawe, bizoroshya urugendo.",
        "Ushyire imbere ubushake bwo guhinduka no gukomeza kwiga."
    ],
    SUPPORT_INFO = (
        "Niba uhanganye n’ihohoterwa rishingiye ku gitsina, agahinda cyangwa ikibazo cy’ubuzima bwo mu mutwe:\n"
        "Vugana n’umutoza cyangwa umuyobozi w’icyizere.\n"
        "Jya ku kigo nderabuzima cyawe.\n"
        "Hamagara umurongo wa GBV: 3512 (ni ubuntu kandi ni ibanga).\n"
        "Saba inama ku bijyanye n’imari muri Umurenge SACCO yawe.\n"
        "Ijwi ryawe rifite agaciro. Ugomba kugira umutekano n’icyubahiro.\n0. Garuka"
    )
)

# Expanded, smarter English and Swahili omitted for brevity but would be written here, with: ABOUT/VISION/MISSION blocks, and all advice arrays >=4 messages (see rw structure above).
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
en.update(ABOUT="Welcome to Real Works! Empowering young mining workers for wellbeing, financial literacy, and workplace safety.")

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
sw.update(ABOUT="Karibu Real Works! Tunasaidia wafanyakazi wachanga wa migodi kupata ustawi.")

LANG_MAP = {'rw': rw, 'en': en, 'sw': sw}

def pick_random_message(options):
    return random.choice(options)

OUTREACH_MATERIAL = '''
Real Works (Rwanda): Supporting mining youth with wellbeing, safety, and financial empowerment.
- Vision: A thriving, purposeful generation.
- Mission: Equip young workers with life skills, resilience, and hope.
- For help: GBV hotline 3512, health center, or Umurenge SACCO adviser.
Top Advice:
- "Gira icyizere, uhitemo icyiza."  /  "Have confidence—choose what uplifts you."
- "Tegura ubuzima bwawe, fata imigenzo myiza ikomeye ku mutekano wawe no ku mafaranga."
- "Support your team, learn every day, and always ask for support when you need it—no one goes it alone!"
'''
