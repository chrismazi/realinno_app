import random

LANGS = ["rw", "en"]

rw = dict(
    ABOUT = (
        "Twite ku Buzima n’Imibereho - Real Works\n\n"
        "Mission: Gutegurira urubyiruko ruri mu kazi ubumenyi bw’ubuzima, imitekerereze, no gucunga ibyabo kugira ngo barusheho kuba abakozi b’indashyikirwa mu mibereho yabo yose.\n\n"
    ),
    MAIN_MENU = (
        "1. Ubuzima bwo mu mutwe n'imibereho myiza\n2. Ubumenyi bw'imari\n3. Umutekano n'ubumenyi bw'ubuzima\n"
        "4. Ubufasha n'amakuru\n5. FAQ/Ikibazo\n6. Sohoka\n7. Kwiyandikisha kuri SMS\n8. Tanga igitekerezo\n"
        "9. Reba aho ugeze\n#. Hindura ururimi"
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

# Complete English content with full parity to Kinyarwanda
en = dict(
    ABOUT = (
        "Focus on Wellbeing & Life - Real Works\n\n"
        "Mission: Prepare young workers with knowledge of health, mental wellbeing, and personal finance management "
        "to become resilient workers throughout their lives.\n\n"
    ),
    MAIN_MENU = (
        "1. Mental Health & Wellbeing\n2. Financial Literacy\n3. Safety & Health Knowledge\n4. Support & Information\n"
        "5. FAQ/About\n6. Exit\n7. Subscribe to SMS\n8. Send Feedback\n9. View Progress\n#. Change Language"
    ),
    MH_MENU = (
        "Mental Health & Wellbeing:\n1. Coping with stress\n2. Dealing with loss/fear\n3. Building confidence\n"
        "4. Healthy relationships\n0. Back"
    ),
    MH_STRESS = [
        "Mining work involves stress. If you feel overwhelmed: Breathe slowly and be patient. "
        "Talk to a trusted friend or supervisor. Take a short break if possible.",
        "If stress persists for a long time, seek help at a health center or from a health professional.",
        "Try to complete the work at hand, remember that asking for help is not weakness.",
        "Find a quiet place, listen to your heartbeat, this reduces stress."
    ],
    MH_LOSS_FEAR = [
        "Losing a friend or fearing going into the mines is painful. You are not alone. "
        "Share your feelings with others, hiding them makes the pain worse.",
        "Feeling fear is not weakness, it's a sign that you value life. Let's help each other, together we are stronger.",
        "Have someone you trust to share your feelings with, it helps.",
        "Do short breathing exercises, you will regain confidence."
    ],
    MH_CONFIDENCE = [
        "Building confidence brings strength. Celebrate what you achieve every day, even simple things. "
        "Learn new skills in safety and life.",
        "Tell yourself 'I am a valuable person and I have confidence.'",
        "Connecting well with others and taking steps to care for yourself builds confidence.",
        "Set simple goals, you will achieve much gradually."
    ],
    MH_RELATIONSHIPS = [
        "Respect brings peace. Say no to violence or sexual pressure.",
        "Treat everyone with respect, whether man or woman. If you're abused, you can report it confidentially "
        "(see 4 in main menu).",
        "Know that everyone has value. Say: I put respect and peace first.",
        "Have friends, don't wait to speak only in problems; even in small joys, appreciate them."
    ],
    FL_MENU = (
        "Financial Literacy:\n1. Saving well\n2. Making a budget\n3. Understanding SACCO loans\n4. Avoiding bad debts\n0. Back"
    ),
    FL_SAVINGS = [
        "Always try to save even if it's little. Use or join your Sector SACCO.",
        "Saving gives you peace and security when you face difficulties.",
        "Make a plan, set goals for the money you save weekly.",
        "Remember: small amounts add up slowly, don't fool yourself that it's too little."
    ],
    FL_BUDGETING = [
        "Separate what you need from what you just want. Write down how you use money weekly.",
        "Plan for life, family and emergencies. A budget is the key to independence.",
        "Good use of money helps you avoid borrowing and having many debts.",
        "Planning plays a big role in maintaining good living conditions."
    ],
    FL_LOANS = [
        "Sector SACCO offers loans based on what you've saved and your good history. Save all the time. "
        "Repay well on time.",
        "A good loan helps you progress, not one that brings you burden.",
        "Take a loan only for a plan that has benefits, avoid repaying beyond your capacity.",
        "SACCO is a good partner; know the rules and regulations before taking a loan."
    ],
    FL_DEBT = [
        "Avoid borrowing money to buy non-urgent things. If you need to borrow, go to an approved institution, "
        "not untrusted people.",
        "Remember: a wise worker plans before using.",
        "Bad debts bring problems; make good decisions before deciding to borrow.",
        "Think first before asking for a loan; can you afford it?"
    ],
    SAFETY_MENU = (
        "Safety & Health Knowledge:\n1. Safe behavior\n2. Working together\n3. Ways to communicate well\n"
        "4. Preparing life goals\n0. Back"
    ),
    SAFETY_BEHAVIOR = [
        "Wear safety equipment all the time. Report to supervisors where conditions are unsafe.",
        "Don't go into the mines alone. Safety is not fear, it's strength.",
        "Be careful about your colleague: if they see danger, help them, call for help.",
        "Avoid working without following safety rules."
    ],
    SAFETY_TEAMWORK = [
        "Respect and working together brings safety. Look out for your colleagues.",
        "Help newcomers at work. Together we overcome, together we progress.",
        "Work as a team, help each other on the path of progress.",
        "Unity at work makes everyone feel important."
    ],
    SAFETY_COMMUNICATION = [
        "Communicating well reduces conflicts. Listen carefully before responding. Speak calmly and respectfully.",
        "Appreciate what others have done.",
        "Take time to listen to your colleague before giving them an answer.",
        "If there are difficulties, speak the truth but maintain respect."
    ],
    SAFETY_GOALS = [
        "Plan your tomorrow. What do you want to achieve in one year?",
        "Write down your goals, and every week take small steps.",
        "Find a friend to track your goals with, it makes the journey easier.",
        "Put first your willingness to change and continue learning."
    ],
    SUPPORT_INFO = (
        "If you're facing gender-based violence, grief, or mental health issues:\n"
        "Talk to a trusted trainer or supervisor.\n"
        "Go to your health center.\n"
        "Call the GBV hotline: 3512 (it's free and confidential).\n"
        "Get advice on finances at your Sector SACCO.\n"
        "Your voice matters. You deserve safety and respect.\n0. Back"
    )
)

LANG_MAP = {'rw': rw, 'en': en}

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
