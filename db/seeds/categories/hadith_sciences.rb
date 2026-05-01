module SeedData
  module HadithSciences
    CATEGORY = {
      slug: "hadith-sciences",
      title: "علوم حدیث",
      position: 1,
      color: "amber-500",
      icon: "quote",
      i18n: {
        en: { title: "Hadith Sciences" }
      }
    }.freeze

    DOMAINS = [
      {
        slug: "hadith-terminology",
        name: "مصطلح الحدیث",
        description: "دانش شناخت اصطلاحات و قواعد حاکم بر طبقه‌بندی روایات اسلامی.",
        position: 0,
        color: "amber-500",
        icon: "book",
        category_slug: "hadith-sciences",
        i18n: {
          en: {
            name: "Hadith Terminology (Mustalah)",
            description: "The discipline that defines the technical vocabulary and classification rules governing prophetic and imami reports."
          }
        },
        concepts: [
          {
            slug: "tarif-hadith",
            title: "تعریف حدیث",
            difficulty_level: :beginner,
            brief_summary: "حدیث در اصطلاح، گفتار، کردار یا تقریر معصوم است که از سوی راویان نقل می‌شود.",
            extended_content: "تعریف حدیث (Definition of Hadith) نخستین گام در ورود به دانش‌های حدیثی است. در سنت شیعه، حدیث به سخن، فعل یا تقریر پیامبر (ص) و امامان معصوم (ع) گفته می‌شود؛ در حالی که در سنت اهل سنت، عمدتاً بر سخن و سیره پیامبر تکیه می‌شود. پاسخ به پرسش «حدیث چیست؟» مرز این دانش را با تاریخ، تفسیر و فقه روشن می‌سازد و مقدمه ضروری ورود به مفاهیم خبر و اثر است.",
            i18n: {
              en: {
                title: "Definition of Hadith",
                brief_summary: "Technically, a hadith is a saying, action, or tacit approval of an infallible reported through narrators.",
                extended_content: "Definition of Hadith is the first step into the hadith sciences. In the Shi'i tradition, a hadith is a saying, deed, or tacit approval of the Prophet (s) and the infallible Imams (a); in the Sunni tradition, it generally refers to the sayings and conduct of the Prophet alone. Answering the question 'what is a hadith?' draws the discipline's boundary against history, exegesis, and jurisprudence, and is the necessary preface to the related notions of khabar and athar."
              }
            }
          },
          {
            slug: "khabar-asar",
            title: "خبر و اثر",
            difficulty_level: :beginner,
            brief_summary: "خبر و اثر، اصطلاحاتی نزدیک به حدیث‌اند؛ خبر گاه عام‌تر و اثر بیشتر بر سخنان صحابه و تابعین اطلاق می‌شود.",
            extended_content: "خبر و اثر (Khabar and Athar) در ادبیات حدیثی گاه مترادف حدیث به کار می‌روند و گاه میان آن‌ها تمایز می‌نهند. برخی، خبر را شامل سخنان معصوم و غیرمعصوم می‌دانند و اثر را به سخنان صحابه و تابعین محدود می‌سازند. شناخت این تمایز اصطلاحی، خواننده را در فهم متون رجالی و حدیثی یاری می‌کند و راه را برای ورود به ساختار سند و متن می‌گشاید.",
            i18n: {
              en: {
                title: "Khabar and Athar",
                brief_summary: "Khabar and athar are terms close to hadith; khabar is sometimes broader, while athar more often denotes the sayings of Companions and Successors.",
                extended_content: "Khabar and Athar are sometimes used as synonyms for hadith and sometimes carefully distinguished. Some scholars treat khabar as covering reports from both infallibles and non-infallibles, restricting athar to the sayings of the Companions and Successors. Grasping this terminological distinction helps the reader interpret rijal and hadith literature and prepares the ground for the structural distinction between sanad (chain) and matn (text)."
              }
            }
          },
          {
            slug: "sanad-matn",
            title: "سند و متن",
            difficulty_level: :beginner,
            brief_summary: "هر حدیث از دو بخش اصلی تشکیل می‌شود: سند، یعنی زنجیره راویان، و متن، یعنی محتوای روایت‌شده.",
            extended_content: "سند و متن (Sanad and Matn) دو رکن ساختاری حدیث‌اند که علم حدیث آن‌ها را به‌طور جداگانه و در پیوند با یکدیگر بررسی می‌کند. سند از پیامبر یا امام آغاز می‌شود و با راویان تا مؤلف کتاب می‌رسد، در حالی که متن، گفتار یا فعلی است که نقل شده است. تشخیص میان نقد سند و نقد متن، نخستین گام برای ورود به مطالعه دسته‌بندی روایات و طبقه‌بندی حدیث صحیح، حسن و ضعیف است.",
            i18n: {
              en: {
                title: "Sanad and Matn",
                brief_summary: "Every hadith has two structural parts: the sanad (chain of narrators) and the matn (the reported content itself).",
                extended_content: "Sanad and Matn are the two structural pillars of a hadith, which the science studies both separately and in relation to one another. The sanad runs from the Prophet or Imam through successive narrators down to the author of the book, while the matn is the saying or action being reported. Distinguishing chain-criticism from text-criticism is the first step toward the classification of reports and the grading of hadith into sahih, hasan, and da'if."
              }
            }
          },
          {
            slug: "hadith-ghodsi",
            title: "حدیث قدسی",
            difficulty_level: :beginner,
            brief_summary: "حدیث قدسی، روایتی است که در آن پیامبر (ص) سخنی را از سوی خداوند نقل می‌کند، اما لفظ آن کلام الهی به‌حساب نمی‌آید.",
            extended_content: "حدیث قدسی (Hadith Qudsi) جایگاهی میان قرآن و حدیث نبوی دارد؛ معنا از خداست و لفظ از پیامبر. این روایات، اغلب در موضوعات اخلاقی و عرفانی‌اند و در مجموعه‌هایی چون «الجواهر السنیة» شیخ حر عاملی گرد آمده‌اند. شناخت حدیث قدسی، فهم خواننده را از گستره انواع روایات و تفاوت آن با وحی قرآنی روشن‌تر می‌کند.",
            i18n: {
              en: {
                title: "Hadith Qudsi",
                brief_summary: "A hadith qudsi is a report in which the Prophet (s) conveys words from God whose wording is not itself counted as Quranic revelation.",
                extended_content: "Hadith Qudsi occupies a middle ground between the Quran and prophetic hadith: the meaning is from God, the wording from the Prophet. These reports are typically ethical or mystical in subject and have been gathered in collections such as al-Jawahir al-Saniyya by Shaykh al-Hurr al-'Amili. Grasping hadith qudsi sharpens the reader's sense of the range of reports and how they differ from Quranic revelation."
              }
            }
          },
          {
            slug: "hadith-marfu",
            title: "حدیث مرفوع",
            difficulty_level: :intermediate,
            brief_summary: "حدیث مرفوع، روایتی است که سند آن به معصوم می‌رسد، خواه به‌صراحت و خواه با قرینه.",
            extended_content: "حدیث مرفوع (Marfu' Hadith) قوی‌ترین انتساب در دسته‌بندی روایات بر اساس مرجع نقل است. اگر صحابی یا راوی پسین، روایت را به پیامبر یا امام نسبت دهد، آن روایت مرفوع شمرده می‌شود. در برابر آن، حدیث موقوف و مقطوع قرار می‌گیرد. شناخت رفع، شالوده ارزیابی حجیت روایت در فقه و کلام است.",
            i18n: {
              en: {
                title: "Marfu' Hadith (Elevated)",
                brief_summary: "A marfu' hadith is one whose chain reaches an infallible, whether explicitly or by contextual indication.",
                extended_content: "Marfu' Hadith carries the strongest attribution in classifying reports by source. When a Companion or later narrator traces the report back to the Prophet or Imam, it is counted as marfu'. It contrasts with mawquf (stopped at a Companion) and maqtu' (stopped at a Successor). Recognising 'elevation' is foundational for evaluating a report's authority in jurisprudence and theology."
              }
            }
          },
          {
            slug: "hadith-mowghoof",
            title: "حدیث موقوف",
            difficulty_level: :intermediate,
            brief_summary: "حدیث موقوف، روایتی است که در سند آن، انتساب به معصوم قطع شده و سخن به صحابی نسبت داده می‌شود.",
            extended_content: "حدیث موقوف (Mawquf Hadith) از سویی در رتبه پایین‌تری از مرفوع قرار دارد و از سوی دیگر، در پاره‌ای موارد ممکن است در حکم مرفوع به شمار آید؛ مثلاً اگر صحابی از موضوعی غیبی سخن بگوید که جز از طریق پیامبر دانسته نمی‌شود. تمایز موقوف از مرفوع، شرط لازم بهره‌گیری دقیق از روایات صحابه است.",
            i18n: {
              en: {
                title: "Mawquf Hadith (Stopped)",
                brief_summary: "A mawquf hadith is one whose chain stops at a Companion rather than reaching an infallible.",
                extended_content: "Mawquf Hadith ranks below marfu' but may, in certain cases, be treated as if marfu' — for example when a Companion reports something unseen that could only have been learned from the Prophet. Distinguishing mawquf from marfu' is a prerequisite for using Companion-reports with the necessary precision."
              }
            }
          },
          {
            slug: "hadith-maghtu",
            title: "حدیث مقطوع",
            difficulty_level: :intermediate,
            brief_summary: "حدیث مقطوع، سخن یا فعلی است که به تابعی یا کسی پس از او نسبت داده می‌شود، نه به معصوم یا صحابی.",
            extended_content: "حدیث مقطوع (Maqtu' Hadith) در شمار مرفوع و موقوف نیست و در فقه شیعه، حجیت مستقلی ندارد. مطالعه آن، اغلب از منظر تاریخی و کلامی برای فهم جریان فکری تابعین صورت می‌گیرد. تمایز روشن میان مرفوع، موقوف و مقطوع، کلید فهم سلسله اعتبار روایات بر مبنای مرجع نقل است.",
            i18n: {
              en: {
                title: "Maqtu' Hadith (Severed at the Successor)",
                brief_summary: "A maqtu' hadith is a saying or action attributed to a Successor or someone later, not to an infallible or Companion.",
                extended_content: "Maqtu' Hadith stands apart from marfu' and mawquf and carries no independent authority in Shi'i jurisprudence. It is mostly studied historically and theologically to trace the intellectual currents of the Successors. Distinguishing marfu', mawquf, and maqtu' clearly is the key to understanding the hierarchy of authority that depends on the source of transmission."
              }
            }
          },
          {
            slug: "tahammol-ada",
            title: "تحمل و اداء حدیث",
            difficulty_level: :intermediate,
            brief_summary: "تحمل، فرآیند گرفتن حدیث از استاد، و اداء، فرآیند نقل آن به دیگران است.",
            extended_content: "تحمل و اداء حدیث (Reception and Transmission) بنیان فرآیند نقل روایت است. عالمان حدیث، شرایط سنی و علمی برای تحمل را بررسی کرده‌اند و تأکید دارند که اداء باید با همان لفظ یا، در صورت اجازه، با حفظ معنا انجام شود. این مفهوم، مقدمه ورود به طرق هشت‌گانه تحمل حدیث است.",
            i18n: {
              en: {
                title: "Reception and Transmission of Hadith",
                brief_summary: "Tahammul is the reception of a hadith from a teacher; ada' is its onward transmission to others.",
                extended_content: "Reception and Transmission (tahammul wa ada') is the backbone of hadith conveyance. Scholars have set out the age and learning required for reception, and stressed that transmission should be word-for-word — or, where permitted, faithful to the meaning. This concept opens the door to the classical eightfold methods of hadith reception."
              }
            }
          },
          {
            slug: "toroogh-tahammol",
            title: "طرق تحمل حدیث",
            difficulty_level: :intermediate,
            brief_summary: "عالمان حدیث، هشت طریق برای تحمل روایت برشمرده‌اند: سماع، قرائت، اجازه، مناوله، کتابت، اعلام، وصیت و وجاده.",
            extended_content: "طرق تحمل حدیث (Methods of Hadith Reception) از سماع که شنیدن مستقیم از استاد است تا وجاده که یافتن دست‌نوشته‌ای بدون اتصال است، در شدت و ضعف اعتبار متفاوت‌اند. اصطلاحاتی مانند «حدثنی»، «اخبرنی»، «انبأنا» و «قرأت علیه»، نشان‌دهنده این طرق در سند روایت‌اند. شناخت این اصطلاحات، فهم درست سند را ممکن می‌سازد.",
            i18n: {
              en: {
                title: "Methods of Hadith Reception",
                brief_summary: "Hadith scholars enumerate eight modes of reception: hearing, reading, ijaza, handing-over, writing, notification, bequest, and discovery.",
                extended_content: "Methods of Hadith Reception range from sama' (direct hearing from the teacher) down to wijada (finding a manuscript without a chain), and they vary widely in evidential weight. Phrases such as 'haddathani', 'akhbarani', 'anba'ana', and 'qara'tu 'alayhi' mark out which mode the chain employs. Mastery of these terms is what makes a chain truly readable."
              }
            }
          },
          {
            slug: "hadith-mottasel",
            title: "حدیث متصل",
            difficulty_level: :intermediate,
            brief_summary: "حدیث متصل، روایتی است که در سند آن، هر راوی به‌صراحت از راوی پیشین خود نقل کرده و انقطاعی رخ نداده است.",
            extended_content: "حدیث متصل (Muttasil Hadith) شرط لازم برای صحیح یا حسن دانستن روایت است. مقابل آن، انواع منقطع، معضل و معلق قرار می‌گیرند. تشخیص اتصال، نیازمند آشنایی با طبقات راویان و طرق تحمل حدیث است تا بتوان امکان شنیدن میان دو راوی پیاپی را سنجید.",
            i18n: {
              en: {
                title: "Muttasil Hadith (Connected)",
                brief_summary: "A muttasil hadith is one whose chain shows each narrator explicitly transmitting from the previous one with no gap.",
                extended_content: "Muttasil Hadith is a precondition for grading a report as sahih or hasan. Opposed to it stand the munqati' (broken), mu'dal (severely broken), and mu'allaq (suspended) forms. Verifying connection requires familiarity with the generational layers of narrators and the methods of reception, so that the possibility of hearing between two consecutive transmitters can be assessed."
              }
            }
          },
          {
            slug: "hadith-mosnad",
            title: "حدیث مسند",
            difficulty_level: :intermediate,
            brief_summary: "حدیث مسند، روایتی متصل است که سند آن بدون انقطاع به پیامبر یا امام می‌رسد.",
            extended_content: "حدیث مسند (Musnad Hadith) ترکیب اتصال سند و رفع است. در اهل سنت، گاه مسند به مجموعه‌های روایی نیز اطلاق می‌شود که روایات هر صحابی را گرد آورده‌اند، مانند مسند احمد بن حنبل. در شیعه، اصطلاح مسند بیشتر بر اتصال سند تا معصوم تأکید دارد و کلید فهم اعتبار روایات است.",
            i18n: {
              en: {
                title: "Musnad Hadith (Supported)",
                brief_summary: "A musnad hadith is a connected report whose chain reaches the Prophet or an Imam without interruption.",
                extended_content: "Musnad Hadith combines the qualities of connection and elevation. In the Sunni tradition, 'musnad' also names whole collections that gather each Companion's reports together — such as the Musnad of Ahmad ibn Hanbal. In Shi'i usage the term emphasises the unbroken chain up to the infallible, and is a key category for evaluating authority."
              }
            }
          },
          {
            slug: "hadith-monqate",
            title: "حدیث منقطع",
            difficulty_level: :intermediate,
            brief_summary: "حدیث منقطع، روایتی است که در میانه سند، یک راوی افتاده باشد.",
            extended_content: "حدیث منقطع (Munqati' Hadith) نخستین گام در شناسایی نقص اتصال سند است. این انقطاع ممکن است از طریق آگاهی از طبقات راویان یا تصریح خود راوی به ندیدن استاد، آشکار شود. حدیث منقطع، ضعیف شمرده می‌شود مگر آن‌که قراین جبران‌کننده وجود داشته باشد. این مفهوم، مقدمه شناخت معضل و معلق است.",
            i18n: {
              en: {
                title: "Munqati' Hadith (Broken)",
                brief_summary: "A munqati' hadith is one in which a single narrator has dropped out somewhere in the middle of the chain.",
                extended_content: "Munqati' Hadith is the first kind of broken-chain to recognise. The break may be detected from knowledge of generational layers or from a narrator's own admission of not having met his alleged teacher. Such reports are graded as weak unless supporting evidence compensates for the gap. This concept is the gateway to recognising mu'dal and mu'allaq forms."
              }
            }
          },
          {
            slug: "hadith-moaallagh",
            title: "حدیث معلق",
            difficulty_level: :intermediate,
            brief_summary: "حدیث معلق، روایتی است که از آغاز سند، یک یا چند راوی افتاده باشد.",
            extended_content: "حدیث معلق (Mu'allaq Hadith) در آثار حدیثی مانند «صحیح بخاری» با عبارت‌هایی چون «قال فلانٌ» شناخته می‌شود. این روایات، اعتبار خود را وامدار وجود طریق متصلی در دیگر بخش‌های همان کتاب یا منابع موازی هستند. تشخیص تعلیق، نیازمند آشنایی عمیق با ساختار کتب جامع حدیثی است.",
            i18n: {
              en: {
                title: "Mu'allaq Hadith (Suspended)",
                brief_summary: "A mu'allaq hadith is one in which one or more narrators have dropped out at the start of the chain.",
                extended_content: "Mu'allaq Hadith is recognised in works such as Sahih al-Bukhari by formulae like 'qala fulan' (so-and-so said). The authority of such reports depends on a connected chain being supplied elsewhere in the same book or in parallel sources. Detecting suspension demands a deep familiarity with how comprehensive hadith books are structured."
              }
            }
          },
          {
            slug: "hadith-morsal",
            title: "حدیث مرسل",
            difficulty_level: :intermediate,
            brief_summary: "حدیث مرسل، روایتی است که تابعی، آن را بدون ذکر صحابی، مستقیم به پیامبر نسبت می‌دهد.",
            extended_content: "حدیث مرسل (Mursal Hadith) به دلیل افتادن واسطه میان تابعی و پیامبر، در ظاهر ضعیف است؛ اما بحث‌های مفصل کلامی و اصولی درباره حجیت آن وجود دارد. در شیعه، اگر مرسِل از مشایخ مورد اعتمادی چون ابن ابی‌عمیر باشد، روایت در حکم متصل تلقی می‌شود. تمایز مرسل از مسند، یکی از موضوعات بنیادی مصطلح است.",
            i18n: {
              en: {
                title: "Mursal Hadith (Sent)",
                brief_summary: "A mursal hadith is a report in which a Successor attributes a saying directly to the Prophet without naming the Companion in between.",
                extended_content: "Mursal Hadith is, on the surface, weak because the link between the Successor and the Prophet has dropped; yet there are detailed theological and usuli debates about whether it carries authority. In Shi'i practice, when the 'sender' is a trusted master such as Ibn Abi 'Umayr, the report is treated as if connected. Distinguishing mursal from musnad is one of the foundational topics of mustalah."
              }
            }
          },
          {
            slug: "hadith-moazal",
            title: "حدیث معضل",
            difficulty_level: :intermediate,
            brief_summary: "حدیث معضل، روایتی است که در سند آن، دو یا چند راوی پشت سر هم افتاده‌اند.",
            extended_content: "حدیث معضل (Mu'dal Hadith) از حدیث منقطع شدیدتر است و فاصله‌ی پدید‌آمده در سند را وسیع‌تر می‌سازد. این نوع، ضعف بیشتری از منقطع دارد و امکان جبران آن دشوارتر است. تشخیص معضل، تسلط ویژه‌ای بر طبقات و سال‌های فعالیت راویان می‌طلبد.",
            i18n: {
              en: {
                title: "Mu'dal Hadith (Severely Broken)",
                brief_summary: "A mu'dal hadith is one in which two or more consecutive narrators have dropped out of the chain.",
                extended_content: "Mu'dal Hadith is graver than munqati' and opens a wider gap in the chain. Its weakness is therefore greater, and compensating for the loss is harder. Detecting mu'dal demands a particular command of narrator generations and their active years."
              }
            }
          },
          {
            slug: "hadith-modallas",
            title: "حدیث مدلس",
            difficulty_level: :advanced,
            brief_summary: "حدیث مدلس، روایتی است که راوی، نقص آن را به‌گونه‌ای پنهان می‌کند تا گویی روایت را مستقیماً از کسی شنیده که نشنیده است.",
            extended_content: "حدیث مدلس (Mudallas Hadith) دو نوع اصلی دارد: تدلیس اسناد، که راوی نام واسطه ضعیف را حذف می‌کند، و تدلیس شیوخ، که راوی، استاد ضعیف خود را با نام یا کنیه ناآشنا می‌خواند تا شناخته نشود. کشف تدلیس، نیازمند بررسی دقیق طبقات راویان و الفاظ تحمل است و یکی از حساس‌ترین مهارت‌های نقد سند است.",
            i18n: {
              en: {
                title: "Mudallas Hadith (Concealed Defect)",
                brief_summary: "A mudallas hadith is one in which the narrator conceals a defect in the chain, making it appear that he heard directly from someone he did not.",
                extended_content: "Mudallas Hadith comes in two main forms: tadlis al-isnad, where a narrator drops the name of a weak intermediary, and tadlis al-shuyukh, where a narrator refers to a weak teacher by an unfamiliar name or kunya so that he goes unrecognised. Uncovering tadlis demands close study of narrator generations and reception phrases, and is one of the most demanding skills in chain-criticism."
              }
            }
          },
          {
            slug: "mashhoor-aziz-gharib",
            title: "حدیث مشهور، عزیز و غریب",
            difficulty_level: :advanced,
            brief_summary: "روایات بر پایه شمار راویان در هر طبقه به مشهور (سه راوی و بیشتر)، عزیز (دو راوی) و غریب (یک راوی) تقسیم می‌شوند.",
            extended_content: "حدیث مشهور، عزیز و غریب (Mashhur, Aziz, Gharib) از تقسیمات مهم خبر واحد است. مشهور به دلیل تعدد طرق اعتبار بیشتری دارد، عزیز در میان دو راوی محصور است، و غریب آن است که در یکی از طبقات سند، تنها یک راوی نقل کرده باشد. این تقسیم، ابزار دقیقی برای ارزیابی پایداری متن از منظر سندی فراهم می‌آورد.",
            i18n: {
              en: {
                title: "Mashhur, Aziz, and Gharib Hadith",
                brief_summary: "By the number of narrators in each layer, reports divide into mashhur (three or more), aziz (two), and gharib (one).",
                extended_content: "Mashhur, Aziz, Gharib is an important subdivision of the single-chain (ahad) report. A mashhur report carries greater weight thanks to multiple paths; an aziz is held by exactly two narrators; a gharib is one in which a single layer of the chain features only one narrator. This division gives the critic a precise tool for assessing how robust a text is from the chain's standpoint."
              }
            }
          },
          {
            slug: "khabar-motavater-vahed",
            title: "خبر متواتر و واحد",
            difficulty_level: :intermediate,
            brief_summary: "حدیث به اعتبار شمار راویان به متواتر (نقل گروهی پرشمار) و واحد (نقل اندک) تقسیم می‌شود.",
            extended_content: "خبر متواتر (Mutawatir) روایتی است که در هر طبقه از راویان، گروهی نقل کرده‌اند که توافق آنان بر دروغ ممکن نیست؛ از این رو، علم آور است. خبر واحد (Ahad) آن است که شرایط تواتر را ندارد و حجیت آن نیازمند پشتوانه قرائن یا شرایط سند است. این تمایز با تقسیم‌بندی صحیح، حسن و ضعیف هم‌پوشانی دارد و چارچوبی برای فهم اقسام حدیث ضعیف فراهم می‌کند.",
            i18n: {
              en: {
                title: "Mutawatir and Ahad Reports",
                brief_summary: "By the number of transmitters, hadith are divided into mutawatir (mass-transmitted) and ahad (single-chain).",
                extended_content: "A mutawatir report is one transmitted in every layer by a group whose collusion in falsehood is inconceivable, and therefore yields certainty. An ahad report falls short of those conditions, and its authority depends on supporting indicators or the qualities of the chain. This distinction overlaps with the sahih–hasan–da'if grading and frames the entire taxonomy of weak hadith."
              }
            }
          },
          {
            slug: "sahih-hasan-zaif",
            title: "حدیث صحیح، حسن و ضعیف",
            difficulty_level: :intermediate,
            brief_summary: "روایات بر اساس وضعیت سند و راویان به سه دسته اصلی صحیح، حسن و ضعیف تقسیم می‌شوند.",
            extended_content: "تقسیم‌بندی حدیث به صحیح، حسن و ضعیف (Sahih, Hasan, Da'if) از قرن هفتم به‌دست عالمانی چون علامه حلی نظام یافت. حدیث صحیح آن است که همه راویانش امامی، عادل و ضابط باشند؛ حسن، شرایطی نزدیک به آن دارد اما در عدالت یکی از راویان تردید است؛ ضعیف، فاقد شرایط لازم در سند است. این طبقه‌بندی بر شناخت دقیق سند و متن استوار است و گذار به موضوع خبر متواتر و واحد را آسان می‌کند.",
            i18n: {
              en: {
                title: "Sahih, Hasan, and Da'if Hadith",
                brief_summary: "By the state of the chain and narrators, hadith are sorted into three main grades: sahih, hasan, and da'if.",
                extended_content: "The grading of hadith into sahih, hasan, and da'if was systematised in the seventh century AH by scholars such as Allama al-Hilli. A sahih report has every narrator Imami, just, and accurate in transmission; a hasan report is close to that, but the integrity of one narrator is uncertain; a da'if report fails one of the chain conditions. The grading rests on a precise reading of sanad and matn and prepares the move to mutawatir and ahad."
              }
            }
          },
          {
            slug: "hadith-mozdaterab",
            title: "حدیث مضطرب",
            difficulty_level: :advanced,
            brief_summary: "حدیث مضطرب، روایتی است که در سند یا متن آن، اختلافی رخ داده که قابل ترجیح نیست.",
            extended_content: "حدیث مضطرب (Mudtarib Hadith) ممکن است در نام راوی، تعداد راویان یا الفاظ متن، با گزارش‌های دیگر در ناسازگاری باشد. اگر یکی از طرق بر دیگری ترجیح داشته باشد، نقل ترجیح‌یافته اعتبار می‌یابد و دیگری اضطراب نامیده نمی‌شود. مطالعه اضطراب، حساسیت محدّث را به ریزه‌کاری‌های نقد متن نشان می‌دهد.",
            i18n: {
              en: {
                title: "Mudtarib Hadith (Disordered)",
                brief_summary: "A mudtarib hadith is one in which the chain or text varies among reports in a way that cannot be reconciled by preferring one path.",
                extended_content: "Mudtarib Hadith may differ from parallel reports in a narrator's name, the count of narrators, or the wording of the text. If one of the paths can be preferred, the preferred reading takes priority and the report is no longer described as 'disordered'. The study of disorder reveals the muhaddith's sensitivity to the finer points of text-criticism."
              }
            }
          },
          {
            slug: "hadith-maghloob",
            title: "حدیث مقلوب",
            difficulty_level: :advanced,
            brief_summary: "حدیث مقلوب، روایتی است که در آن جای دو راوی یا دو واژه از متن، عمداً یا سهواً جابه‌جا شده باشد.",
            extended_content: "حدیث مقلوب (Maqlub Hadith) گاه برای امتحان حافظه محدّث ساخته می‌شد و گاه از خطای راوی برمی‌خاست. کشف قلب، نیازمند مقایسه طرق گوناگون نقل و تطبیق آن با حافظه راویان موثق است. شناخت این آفت، شرط ضروری برای تمیز روایت معتبر از روایت تحریف‌شده است.",
            i18n: {
              en: {
                title: "Maqlub Hadith (Inverted)",
                brief_summary: "A maqlub hadith is one in which two narrators or two words of the text have been swapped, intentionally or by mistake.",
                extended_content: "Maqlub Hadith was sometimes constructed deliberately to test a muhaddith's memory and sometimes arose from a narrator's slip. Detecting inversion calls for comparison across the various paths of transmission and against the memory of trusted narrators. Recognising this defect is a necessary condition for telling a sound report from a corrupted one."
              }
            }
          },
          {
            slug: "hadith-modraj",
            title: "حدیث مدرج",
            difficulty_level: :advanced,
            brief_summary: "حدیث مدرج، روایتی است که در آن، سخن راوی یا توضیحی از او، به متن حدیث افزوده شده و گویی بخشی از آن نشان داده می‌شود.",
            extended_content: "حدیث مدرج (Mudraj Hadith) ممکن است در آغاز، میانه یا پایان متن رخ دهد و خطر آن، خلط کلام راوی با کلام معصوم است. کشف ادراج، گاه با تصریح خود راوی در طریق دیگر و گاه با قرینه‌ای متنی ممکن می‌شود. مطالعه آن، فهم مرز دقیق میان متن اصلی و افزوده‌های راوی را تقویت می‌کند.",
            i18n: {
              en: {
                title: "Mudraj Hadith (Interpolated)",
                brief_summary: "A mudraj hadith is one in which a narrator's words or explanation have been blended into the text and appear to be part of it.",
                extended_content: "Mudraj Hadith may occur at the beginning, middle, or end of a text, and its danger lies in fusing a narrator's words with those of the infallible. Interpolation is uncovered sometimes through the narrator's own admission via another path, and sometimes through internal textual indicators. Studying it sharpens one's sense of the boundary between the original text and a narrator's additions."
              }
            }
          },
          {
            slug: "shaz-monkar",
            title: "حدیث شاذ و منکر",
            difficulty_level: :advanced,
            brief_summary: "شاذ، روایت ثقه‌ای است که با ثقات هم‌رتبه ناسازگار است؛ منکر، نقل ضعیفی است که با ثقات منافات دارد.",
            extended_content: "حدیث شاذ و منکر (Shadhdh and Munkar) دو نوع از علل پنهان حدیث‌اند که مقابل «محفوظ» و «معروف» می‌ایستند. تفاوت آن‌ها در رتبه راوی است: در شاذ، راوی ثقه است اما تک‌رو شده؛ در منکر، راوی ضعیف است و تخالف او سنگین‌تر است. این دو، در نقد حدیث پیشرفته، نشانه‌ی نیاز به بازنگری در اعتبار روایت‌اند.",
            i18n: {
              en: {
                title: "Shadhdh and Munkar Hadith",
                brief_summary: "Shadhdh is a report by a reliable narrator that conflicts with peers of equal standing; munkar is a report by a weak narrator that conflicts with the reliable.",
                extended_content: "Shadhdh and Munkar Hadith are two species of hidden defects in a report, set against the categories 'preserved' (mahfuz) and 'well-known' (ma'ruf). The difference lies in the narrator's standing: in shadhdh the narrator is reliable but stands alone; in munkar he is weak and the conflict is graver. In advanced criticism, both signal that a report's authority needs reassessment."
              }
            }
          },
          {
            slug: "hadith-mowzoo",
            title: "حدیث موضوع",
            difficulty_level: :advanced,
            brief_summary: "حدیث موضوع، روایتی است که جعل شده و به دروغ به معصوم نسبت داده شده است.",
            extended_content: "حدیث موضوع (Mawdu' Hadith) برترین درجه ضعف و در حقیقت، خارج از دایره حدیث است. عالمان حدیث، نشانه‌هایی برای کشف وضع برشمرده‌اند: ضعف ساختار ادبی، مخالفت آشکار با قرآن، پاداش‌های اغراق‌آمیز، و اعتراف خود واضع. کتاب‌هایی چون «الموضوعات» ابن جوزی، تلاشی برای پاکسازی منابع از این آفت بوده است.",
            i18n: {
              en: {
                title: "Mawdu' Hadith (Fabricated)",
                brief_summary: "A mawdu' hadith is a report that has been fabricated and falsely ascribed to an infallible.",
                extended_content: "Mawdu' Hadith is the most extreme grade of weakness — in truth, outside the bounds of hadith altogether. Scholars have catalogued indicators of fabrication: literary clumsiness, plain contradiction of the Quran, exaggerated rewards, and the fabricator's own confession. Works such as Ibn al-Jawzi's al-Mawdu'at were efforts to purge the sources of this contamination."
              }
            }
          },
          {
            slug: "aghsam-zaif",
            title: "اقسام حدیث ضعیف",
            difficulty_level: :advanced,
            brief_summary: "حدیث ضعیف بر پایه نوع نقص در سند به اقسام گوناگونی چون مرسل، منقطع، معضل، مضطرب و موضوع تقسیم می‌شود.",
            extended_content: "اقسام حدیث ضعیف (Categories of Da'if Hadith) شامل مرسل (افتادگی صحابی)، منقطع (افتادگی یک راوی در میانه)، معضل (افتادگی دو راوی پشت سر هم)، مضطرب (اختلاف نقل بدون ترجیح)، شاذ (مخالفت با ثقات) و موضوع (جعلی) است. شناسایی این اقسام، مهارتی پیشرفته است که بر تسلط بر دسته‌بندی صحیح، حسن و ضعیف و آگاهی از تفاوت متواتر و واحد بنا می‌شود.",
            i18n: {
              en: {
                title: "Categories of Da'if Hadith",
                brief_summary: "Weak reports are subdivided by the type of chain defect into mursal, munqati', mu'dal, mudtarib, shadhdh, mawdu', and others.",
                extended_content: "Categories of Da'if Hadith include mursal (a missing Companion), munqati' (one missing narrator in the middle), mu'dal (two consecutive narrators missing), mudtarib (irreconcilable variants), shadhdh (a narrator at odds with reliable peers), and mawdu' (fabricated). Recognising these is an advanced skill that builds on the sahih–hasan–da'if grading and on the distinction between mutawatir and ahad."
              }
            }
          }
        ]
      },
      {
        slug: "rijal",
        name: "رجال",
        description: "دانش شناخت راویان حدیث و ارزیابی وثاقت یا ضعف ایشان.",
        position: 1,
        color: "orange-500",
        icon: "users",
        category_slug: "hadith-sciences",
        i18n: {
          en: {
            name: "Rijal (Narrator Biography)",
            description: "The discipline of identifying hadith narrators and judging their reliability or weakness."
          }
        },
        concepts: [
          {
            slug: "tarif-elm-rijal",
            title: "تعریف علم رجال",
            difficulty_level: :beginner,
            brief_summary: "علم رجال، دانش بررسی احوال راویان حدیث برای داوری درباره اعتبار نقل ایشان است.",
            extended_content: "تعریف علم رجال (Definition of Ilm al-Rijal) آن را از علم درایه و فقه‌الحدیث متمایز می‌سازد. در حالی که درایه به فهم متن و فقه‌الحدیث به استنباط احکام می‌پردازد، رجال بر شخص راوی متمرکز است. این دانش، پیش‌نیاز هرگونه ارزیابی سند و گام نخست برای فهم اهمیت رجال در علوم حدیث به شمار می‌رود.",
            i18n: {
              en: {
                title: "Definition of 'Ilm al-Rijal",
                brief_summary: "'Ilm al-Rijal is the discipline that examines the lives of hadith narrators in order to judge the reliability of their transmissions.",
                extended_content: "Definition of 'Ilm al-Rijal sets it apart from dirayah and fiqh al-hadith. While dirayah concerns the understanding of the text and fiqh al-hadith concerns deriving legal rulings, rijal focuses on the narrator as a person. The discipline is the prerequisite for any chain-evaluation and the first step toward grasping why rijal matters within the hadith sciences as a whole."
              }
            }
          },
          {
            slug: "ahammiyat-rijal",
            title: "اهمیت علم رجال",
            difficulty_level: :beginner,
            brief_summary: "بی علم رجال، نمی‌توان میان روایت معتبر و غیرمعتبر تمایز نهاد و از این رو، بنیان فقه و کلام بر این دانش استوار است.",
            extended_content: "اهمیت علم رجال (Importance of Ilm al-Rijal) از آنجا برمی‌خیزد که حجیت روایت در گرو شناخت ناقل آن است. عالمانی چون شیخ بهایی، علامه مامقانی و آیت‌الله خویی بر ضرورت تسلط فقیه بر رجال تأکید کرده‌اند. این آگاهی، مقدمه ورود به مفاهیم پایه رجال و دستگاه اصطلاحات آن است.",
            i18n: {
              en: {
                title: "Importance of 'Ilm al-Rijal",
                brief_summary: "Without rijal, one cannot tell a reliable report from an unreliable one — which is why jurisprudence and theology rest upon this discipline.",
                extended_content: "The Importance of 'Ilm al-Rijal arises from the fact that a report's authority depends on knowing who transmitted it. Scholars such as Shaykh al-Baha'i, Allama al-Mamaqani, and Ayatollah al-Khu'i have stressed that the jurist must be at home in rijal. That awareness is the doorway into the basic concepts of rijal and its system of technical terms."
              }
            }
          },
          {
            slug: "mafahim-paye-rijal",
            title: "مفاهیم پایه رجال",
            difficulty_level: :beginner,
            brief_summary: "مفاهیم پایه‌ی رجال شامل اصطلاحاتی چون راوی، شیخ، ثقه، عدل، ضابط، مهمل و مجهول است.",
            extended_content: "مفاهیم پایه رجال (Basic Concepts of Rijal) چارچوب فهم منابع رجالی را فراهم می‌سازد. راوی، ناقل حدیث است؛ شیخ، استاد راوی؛ ثقه، راوی مورد اعتماد؛ عدل، راوی شایسته از منظر اخلاقی؛ ضابط، راوی دقیق در حفظ؛ مهمل، راوی بدون توصیف؛ و مجهول، راوی ناشناس. تسلط بر این اصطلاحات، شرط ورود به مطالعه عملی علم رجال است.",
            i18n: {
              en: {
                title: "Basic Concepts of Rijal",
                brief_summary: "The basics of rijal include terms such as narrator, shaykh, thiqa (trustworthy), 'adl (upright), dabit (accurate), muhmal (undescribed), and majhul (unknown).",
                extended_content: "Basic Concepts of Rijal supply the frame within which rijal sources can be read. The 'narrator' is the conveyor of the hadith; the 'shaykh' is his teacher; thiqa is the trusted narrator; 'adl is the morally upright one; dabit is the precise memoriser; muhmal is the narrator with no description on record; and majhul is the unknown narrator. Command of these terms is the precondition for any practical study of the science."
              }
            }
          },
          {
            slug: "elm-rijal",
            title: "علم رجال",
            difficulty_level: :beginner,
            brief_summary: "علم رجال، دانشی است که به شناسایی راویان حدیث و بررسی احوال آنان می‌پردازد.",
            extended_content: "علم رجال (Ilm al-Rijal) با هدف داوری درباره اعتبار راویان شکل گرفت تا روایات صحیح از ضعیف بازشناخته شود. این دانش، اطلاعات تاریخی، اعتقادی و اخلاقی هر راوی را گرد می‌آورد و می‌کوشد جایگاه او را در زنجیره نقل روشن کند. رجال، پیش‌نیاز ضروری برای کاربست جرح و تعدیل و فهم اعتبار کتب حدیثی است.",
            i18n: {
              en: {
                title: "'Ilm al-Rijal",
                brief_summary: "'Ilm al-Rijal is the discipline of identifying hadith narrators and examining their personal circumstances.",
                extended_content: "'Ilm al-Rijal arose to judge the reliability of narrators so that sound reports could be distinguished from weak ones. It gathers each narrator's biographical, doctrinal, and ethical record and seeks to clarify his position in the chain of transmission. Rijal is a necessary prerequisite for applying jarh wa ta'dil and for assessing the authority of the major hadith books."
              }
            }
          },
          {
            slug: "edalat-ravi",
            title: "عدالت راوی",
            difficulty_level: :intermediate,
            brief_summary: "عدالت راوی، ملکه‌ای نفسانی است که او را از ارتکاب گناه کبیره و اصرار بر گناه صغیره بازمی‌دارد.",
            extended_content: "عدالت راوی (Adalah of the Narrator) رکن نخست توثیق در نظر بسیاری از فقیهان است. راه‌های اثبات عدالت، تصریح ناقد رجالی، شهرت میان عالمان، یا حسن ظاهر است. اختلاف‌نظر در سختگیری شرایط عدالت، یکی از مباحث مهم میان مدرسه قدما و متأخرین است و بر مفاهیم پایه رجال استوار می‌شود.",
            i18n: {
              en: {
                title: "'Adalah of the Narrator",
                brief_summary: "'Adalah is an inner moral disposition that restrains the narrator from committing major sins or persisting in minor ones.",
                extended_content: "'Adalah of the Narrator is, for many jurists, the first pillar of authentication. It can be established by an explicit statement from a rijal critic, by a narrator's good standing among the scholars, or by outward uprightness. The disagreement over how strict the conditions of 'adalah should be is one of the major debates between the early scholars (qudama) and the later scholars (muta'akhkhirun), and rests on the basic concepts of rijal."
              }
            }
          },
          {
            slug: "zabt-ravi",
            title: "ضبط راوی",
            difficulty_level: :intermediate,
            brief_summary: "ضبط راوی، توان حفظ دقیق روایت از زمان تحمل تا اداء بدون خطا یا فراموشی است.",
            extended_content: "ضبط راوی (Dabt of the Narrator) در کنار عدالت، شرط دوم ثقه بودن است. ضبط بر دو نوع است: ضبط صدر (حفظ ذهنی) و ضبط کتاب (دقت در نوشتن و نگهداری متن). راوی عادل اما کم‌حافظه، روایتش از درجه صحیح فرو می‌افتد. این مفهوم، نشان می‌دهد چرا توثیق صرف برای صحت روایت کافی نیست.",
            i18n: {
              en: {
                title: "Dabt of the Narrator",
                brief_summary: "Dabt is the narrator's ability to retain a report accurately, from reception to transmission, without error or forgetfulness.",
                extended_content: "Dabt of the Narrator is, alongside 'adalah, the second condition of being thiqa (trustworthy). It comes in two forms: dabt al-sadr (mental retention) and dabt al-kitab (care in writing and preserving the text). An upright but weak-memoried narrator drops below the sahih grade. This concept makes plain why authentication of character alone is not sufficient for grading a report."
              }
            }
          },
          {
            slug: "imamiyat-ravi",
            title: "امامیت راوی",
            difficulty_level: :intermediate,
            brief_summary: "در نگاه مشهور شیعه، یکی از شرایط حدیث صحیح آن است که راوی امامی، یعنی شیعه دوازده‌امامی باشد.",
            extended_content: "امامیت راوی (Imami Identity of the Narrator) معیاری مذهبی است که با عدالت و ضبط ترکیب می‌شود تا روایت در درجه صحیح قرار گیرد. در برابر روایات راویان غیرامامی موثق، اصطلاح «موثّق» به کار می‌رود که جدای از «صحیح» شمرده می‌شود. این تمایز، نشان‌دهنده ظرافت دستگاه اصطلاحی شیعه است.",
            i18n: {
              en: {
                title: "Imami Identity of the Narrator",
                brief_summary: "On the dominant Shi'i view, one condition for a sahih hadith is that the narrator be an Imami — a Twelver Shi'i.",
                extended_content: "Imami Identity of the Narrator is a doctrinal criterion combined with 'adalah and dabt to place a report in the sahih grade. Reports from reliable non-Imami narrators are instead classed as muwaththaq, which is graded separately from sahih. The distinction shows the careful articulation of the Shi'i terminological system."
              }
            }
          },
          {
            slug: "estelahat-towsigh",
            title: "اصطلاحات توثیق",
            difficulty_level: :intermediate,
            brief_summary: "اصطلاحاتی مانند «ثقه»، «عدل»، «صدوق»، «وجه» و «شیخ الطائفه» نشان‌دهنده توثیق راوی هستند.",
            extended_content: "اصطلاحات توثیق (Terms of Authentication) از سوی عالمان رجال در رتبه‌های گوناگون به کار می‌روند. «ثقة ثقة» و «عین» در درجات بالاتر از «صدوق» و «خیّر» قرار می‌گیرند. شناخت این مراتب، فهم دقیق ارزیابی هر راوی را ممکن می‌سازد و گام پیشین درک اصطلاحات تضعیف است.",
            i18n: {
              en: {
                title: "Terms of Authentication",
                brief_summary: "Terms such as thiqa, 'adl, saduq, wajh, and 'shaykh al-ta'ifa' all signal authentication of a narrator.",
                extended_content: "Terms of Authentication are deployed by rijal scholars across a graded scale. 'Thiqa thiqa' and 'ayn' lie above 'saduq' and 'khayyir'. Knowing these grades is what makes a precise reading of any narrator's evaluation possible and is the necessary preliminary to the parallel terms of disparagement."
              }
            }
          },
          {
            slug: "estelahat-tazaif",
            title: "اصطلاحات تضعیف",
            difficulty_level: :intermediate,
            brief_summary: "اصطلاحاتی چون «ضعیف»، «کذّاب»، «وضّاع»، «متروک» و «مجهول» نشان‌دهنده تضعیف راوی هستند.",
            extended_content: "اصطلاحات تضعیف (Terms of Disparagement) نیز مراتب گوناگونی دارند؛ «وضّاع» (جاعل حدیث) شدیدترین جرح است و «مجهول الحال» سبک‌ترین. عالمان رجال، گاه با عبارت‌هایی چون «فی روایته نظر» یا «لیس بشیء»، ضعف راوی را با ابهام بیان می‌کنند. تسلط بر این مراتب، شرط لازم اعمال جرح و تعدیل است.",
            i18n: {
              en: {
                title: "Terms of Disparagement",
                brief_summary: "Terms such as da'if, kadhdhab, wadda', matruk, and majhul all signal disparagement of a narrator.",
                extended_content: "Terms of Disparagement also span a graded scale: wadda' (a habitual fabricator) is the harshest verdict, while majhul al-hal is the lightest. Rijal scholars sometimes signal a narrator's weakness more obliquely, with phrases such as 'fi riwayatihi nazar' or 'laysa bi-shay'. Command of these grades is the prerequisite for applying jarh wa ta'dil correctly."
              }
            }
          },
          {
            slug: "jarh-tadil",
            title: "جرح و تعدیل",
            difficulty_level: :intermediate,
            brief_summary: "جرح و تعدیل، فرآیند ارزیابی راویان از نظر وثاقت و عدالت یا برشمردن نقاط ضعف ایشان است.",
            extended_content: "جرح و تعدیل (Critical Evaluation of Narrators) دو روی یک سکه‌اند: جرح، بیان عیوب راوی است که اعتبار نقل او را می‌کاهد، و تعدیل، گواهی به وثاقت و دقت اوست. عالمان این فن، اصطلاحاتی نظام‌مند مانند «ثقه»، «عدل»، «مجهول»، «ضعیف» و «وضّاع» به کار می‌گیرند و تعارض میان جرح و تعدیل را با قواعد ویژه حل می‌کنند. این دانش، شالوده اعتبارسنجی روایات بر پایه علم رجال است.",
            i18n: {
              en: {
                title: "Jarh wa Ta'dil",
                brief_summary: "Jarh wa ta'dil is the process of evaluating narrators for trustworthiness and uprightness, or itemising their weaknesses.",
                extended_content: "Jarh wa Ta'dil are two sides of one coin: jarh enumerates a narrator's defects and lowers the authority of his transmissions, while ta'dil testifies to his reliability and precision. Practitioners of this craft use a structured vocabulary — thiqa, 'adl, majhul, da'if, wadda' — and resolve conflicts between jarh and ta'dil through dedicated rules. The discipline is the foundation of evaluating reports through 'ilm al-rijal."
              }
            }
          },
          {
            slug: "maratib-jarh-tadil",
            title: "مراتب جرح و تعدیل",
            difficulty_level: :advanced,
            brief_summary: "جرح و تعدیل دارای مراتب متعددی است که در نتیجه‌گیری درباره اعتبار روایت تأثیر می‌گذارد.",
            extended_content: "مراتب جرح و تعدیل (Degrees of Jarh and Ta'dil) معمولاً به شش رتبه از بالاترین تا پایین‌ترین تقسیم می‌شوند. عالمانی چون ابن حجر در «نخبة الفکر»، شیخ طوسی و مامقانی در «تنقیح المقال»، این مراتب را نظام داده‌اند. شناخت این درجات، از قضاوت‌های شتاب‌زده درباره راویان جلوگیری می‌کند.",
            i18n: {
              en: {
                title: "Degrees of Jarh and Ta'dil",
                brief_summary: "Jarh wa ta'dil operates across multiple grades that shape the verdict on a report's authority.",
                extended_content: "Degrees of Jarh and Ta'dil are typically arranged in six tiers running from the highest to the lowest. Scholars such as Ibn Hajar in Nukhbat al-Fikr, al-Shaykh al-Tusi, and al-Mamaqani in Tanqih al-Maqal have systematised these tiers. Knowing the gradation guards the researcher against rushed verdicts on individual narrators."
              }
            }
          },
          {
            slug: "taarez-jarh-tadil",
            title: "تعارض جرح و تعدیل",
            difficulty_level: :advanced,
            brief_summary: "هرگاه درباره یک راوی، هم جرح و هم تعدیل وارد شده باشد، قواعدی برای ترجیح یکی بر دیگری به کار می‌رود.",
            extended_content: "تعارض جرح و تعدیل (Conflict of Jarh and Ta'dil) با اصولی چون «الجرح مقدّم علی التعدیل اذا کان مفسّراً»، یعنی جرح مفسّر بر تعدیل مجمل مقدم است، حل می‌شود. اما اگر تعدیل از سوی شمار بیشتری یا متخصص‌تر صورت گیرد، جای تأمل دارد. این مهارت، اوج پختگی محقق رجالی است.",
            i18n: {
              en: {
                title: "Conflict between Jarh and Ta'dil",
                brief_summary: "When a single narrator is described both as defective and as upright, dedicated rules govern which verdict prevails.",
                extended_content: "Conflict between Jarh and Ta'dil is settled by principles such as 'al-jarh muqaddam 'ala al-ta'dil idha kana mufassaran' — explained jarh outranks an unspecified ta'dil. Yet if ta'dil comes from a larger or more specialised group of evaluators, the case calls for further reflection. Mastering these conflicts is the mark of a mature rijal researcher."
              }
            }
          },
          {
            slug: "tabaghat-raviyan",
            title: "طبقات راویان",
            difficulty_level: :intermediate,
            brief_summary: "طبقات راویان، دسته‌بندی راویان بر پایه نسل و معاصرت آنان با امامان و یکدیگر است.",
            extended_content: "طبقات راویان (Generational Layers of Narrators) به محقق کمک می‌کند تا اتصال یا انقطاع سند را تشخیص دهد و امکان لقای دو راوی را بسنجد. اگر دو راوی متعلق به طبقاتی باشند که زمان یکدیگر را درک نکرده‌اند، نقل مستقیم میانشان مشکوک می‌شود. این مهارت با جرح و تعدیل تکمیل می‌شود و راه را برای ارزیابی منابع کلان حدیثی همچون کتب اربعه می‌گشاید.",
            i18n: {
              en: {
                title: "Generational Layers of Narrators",
                brief_summary: "Tabaqat groups narrators by generation and by their contemporaneity with the Imams and one another.",
                extended_content: "Generational Layers of Narrators help the researcher decide whether a chain is connected or broken, and whether two named transmitters could plausibly have met. If two narrators belong to layers that did not overlap in time, direct transmission between them is suspect. The skill is completed by jarh wa ta'dil and opens the way to evaluating the great hadith corpora such as the Four Books."
              }
            }
          },
          {
            slug: "towsighat-aam",
            title: "توثیقات عام",
            difficulty_level: :advanced,
            brief_summary: "توثیقات عام، گواهی‌هایی است که عالم رجالی، گروهی از راویان را به‌طور دسته‌جمعی توثیق می‌کند.",
            extended_content: "توثیقات عام (General Authentications) شامل مواردی چون توثیق همه راویان «کامل الزیارات» از سوی ابن قولویه، یا همه راویان «تفسیر علی بن ابراهیم قمی» است. اعتبار این توثیقات، خود محل بحث جدی در میان متأخرین است و آیت‌الله خویی در «معجم رجال الحدیث»، در پاره‌ای از این موارد تجدیدنظر کرده است.",
            i18n: {
              en: {
                title: "General Authentications",
                brief_summary: "General authentications are statements in which a rijal scholar authenticates a whole group of narrators at once.",
                extended_content: "General Authentications include such cases as Ibn Quluyah's authentication of every narrator in Kamil al-Ziyarat, or the authentication of all narrators in the Tafsir attributed to 'Ali ibn Ibrahim al-Qummi. The validity of these blanket authentications is itself a serious matter of debate among the later scholars, and Ayatollah al-Khu'i revised some of them in Mu'jam Rijal al-Hadith."
              }
            }
          },
          {
            slug: "towsighat-khass",
            title: "توثیقات خاص",
            difficulty_level: :advanced,
            brief_summary: "توثیقات خاص، گواهی صریح عالم رجالی درباره وثاقت یک راوی معین است.",
            extended_content: "توثیقات خاص (Specific Authentications) معتبرتر از توثیقات عام شمرده می‌شود، زیرا بر شناخت دقیق راوی مورد نظر مبتنی است. در برابر توثیقات شیخ طوسی، نجاشی و کشی، گاه عالمان متأخر اختلاف‌نظر دارند و باید قواعد تعارض جرح و تعدیل را به کار بست. این مفهوم، ابزاری دقیق در دست محقق رجالی است.",
            i18n: {
              en: {
                title: "Specific Authentications",
                brief_summary: "Specific authentications are explicit statements by a rijal scholar about the reliability of a particular named narrator.",
                extended_content: "Specific Authentications carry more weight than general ones because they rest on close knowledge of the narrator in question. Against the authentications offered by al-Tusi, al-Najashi, and al-Kashshi the later scholars sometimes disagree, and the conflict-resolution rules of jarh wa ta'dil must be applied. The concept is a precise instrument in the hands of the rijal researcher."
              }
            }
          },
          {
            slug: "ashab-ejma",
            title: "اصحاب اجماع",
            difficulty_level: :advanced,
            brief_summary: "اصحاب اجماع، هجده تن از اصحاب امام صادق، باقر و کاظم (ع) هستند که عالمان شیعه بر صحت روایات ایشان اجماع کرده‌اند.",
            extended_content: "اصحاب اجماع (Companions of Consensus) را کشی نخستین بار برشمرد و آنان را به سه گروه شش‌نفره تقسیم کرد. زراره، محمد بن مسلم، صفوان بن یحیی و یونس بن عبدالرحمن از مشهورترین ایشان‌اند. درباره معنای دقیق این اجماع — توثیق راوی یا تصحیح هر روایت — اختلاف‌نظر هست و این بحث، یکی از ظریف‌ترین مسائل رجالی است.",
            i18n: {
              en: {
                title: "Companions of Consensus (Ashab al-Ijma')",
                brief_summary: "The Companions of Consensus are eighteen disciples of Imams al-Sadiq, al-Baqir, and al-Kazim (a) on whose narrations the Shi'i scholars are in consensus.",
                extended_content: "Companions of Consensus were first enumerated by al-Kashshi, who divided them into three groups of six. Zurara, Muhammad ibn Muslim, Safwan ibn Yahya, and Yunus ibn 'Abd al-Rahman are among the most famous. Whether this consensus authenticates only the narrators or every report they transmit is itself contested, and the question is among the most delicate in the discipline."
              }
            }
          },
          {
            slug: "osool-arbaa-mia",
            title: "اصول اربع‌مائه",
            difficulty_level: :advanced,
            brief_summary: "اصول اربعمائه، چهارصد اصل حدیثی است که اصحاب امامان (ع) به‌طور مستقیم از ایشان نوشته بودند.",
            extended_content: "اصول اربع‌مائه (The Four Hundred Foundational Texts) منبع نخستین بسیاری از روایات کتب اربعه است. این اصول در دوران تدوین جوامع، بدنه‌ی روایات معتبر را تشکیل می‌دادند و امروزه بیشتر آن‌ها به صورت مستقل در دسترس نیستند، بلکه از طریق نقل در کتب بعدی به ما رسیده‌اند. شناخت آن‌ها، چارچوب تاریخی مطالعات رجالی شیعه است.",
            i18n: {
              en: {
                title: "The Four Hundred Foundational Texts (al-Usul al-Arba'a Mi'a)",
                brief_summary: "The Four Hundred Foundational Texts are early hadith collections written by the Imams' companions directly from the Imams (a).",
                extended_content: "The Four Hundred Foundational Texts are the source from which a great many of the reports in the Four Books were drawn. During the era of major compilations they formed the body of reliable narration; most are no longer available as standalone works and survive only through quotation in later books. Knowing them sets the historical framework for Shi'i rijal studies."
              }
            }
          },
          {
            slug: "rijal-keshi",
            title: "رجال کشی",
            difficulty_level: :advanced,
            brief_summary: "«اختیار معرفة الرجال» تألیف شیخ طوسی بر پایه «معرفة الناقلین» کشی، کهن‌ترین کتاب رجالی موجود شیعه است.",
            extended_content: "رجال کشی (Rijal of al-Kashshi) با رویکرد روایی، اخبار توثیق و تضعیف راویان را از منابع کهن گرد می‌آورد. شیخ طوسی، اصل کتاب کشی را به دلیل برخی نقص‌ها بازآرایی کرد و نام «اختیار معرفة الرجال» را بر آن نهاد. این اثر، یکی از منابع چهارگانه رجال شیعه است.",
            i18n: {
              en: {
                title: "Rijal of al-Kashshi",
                brief_summary: "Ikhtiyar Ma'rifat al-Rijal — al-Tusi's reworking of al-Kashshi's Ma'rifat al-Naqilin — is the oldest surviving Shi'i rijal book.",
                extended_content: "Rijal of al-Kashshi adopts a narration-based approach, gathering reports of authentication and disparagement from early sources. Al-Tusi rearranged al-Kashshi's original work, on account of some shortcomings, and renamed it Ikhtiyar Ma'rifat al-Rijal. The work is one of the four canonical Shi'i rijal sources."
              }
            }
          },
          {
            slug: "rijal-najashi",
            title: "رجال نجاشی",
            difficulty_level: :advanced,
            brief_summary: "«فهرست اسماء مصنّفی الشیعة» تألیف ابوالعباس نجاشی، دقیق‌ترین و معتبرترین کتاب رجالی شیعه شمرده می‌شود.",
            extended_content: "رجال نجاشی (Rijal of al-Najashi) در سده پنجم هجری، شرح حال راویان و مؤلفان شیعی را با ذکر آثار، طریق نقل و توثیق ایشان فراهم آورد. دقت نجاشی، تخصص رجالی او و موضع‌گیری انتقادی‌اش، این اثر را به مرجع نخست متخصصان تبدیل کرده است.",
            i18n: {
              en: {
                title: "Rijal of al-Najashi",
                brief_summary: "Fihrist Asma' Musannifi al-Shi'a by Abu al-'Abbas al-Najashi is regarded as the most precise and authoritative Shi'i rijal book.",
                extended_content: "Rijal of al-Najashi was compiled in the fifth century AH, providing biographies of Shi'i narrators and authors with their works, transmission paths, and authentications. Al-Najashi's precision, his rijal specialism, and his willingness to take critical positions have made the work the reference of first resort among specialists."
              }
            }
          },
          {
            slug: "rijal-tousi",
            title: "رجال شیخ طوسی",
            difficulty_level: :advanced,
            brief_summary: "«رجال شیخ طوسی» راویان را بر پایه طبقه و معاصرت ایشان با هر امام دسته‌بندی می‌کند.",
            extended_content: "رجال شیخ طوسی (Rijal of al-Shaykh al-Tusi) با ساختار طبقه‌بندی، خواننده را قادر می‌سازد بفهمد هر راوی شاگرد کدام امام بوده است. این اثر، در کنار «رجال کشی»، «فهرست شیخ طوسی» و «رجال نجاشی»، چهار رکن اصلی منابع رجالی شیعه را تشکیل می‌دهد.",
            i18n: {
              en: {
                title: "Rijal of al-Shaykh al-Tusi",
                brief_summary: "Rijal al-Shaykh al-Tusi groups narrators by generation and by their relationship to each Imam they served.",
                extended_content: "Rijal of al-Shaykh al-Tusi uses a generational layout that lets the reader see at a glance which Imam each narrator studied under. Together with Rijal al-Kashshi, al-Fihrist al-Tusi, and Rijal al-Najashi, it is one of the four pillars of the Shi'i rijal corpus."
              }
            }
          },
          {
            slug: "fehrest-tousi",
            title: "فهرست شیخ طوسی",
            difficulty_level: :advanced,
            brief_summary: "«الفهرست» شیخ طوسی، فهرست مؤلفان شیعی و آثار حدیثی‌فقهی ایشان همراه با طریق روایت آن است.",
            extended_content: "فهرست شیخ طوسی (Al-Fihrist of al-Shaykh al-Tusi) از منابع کلیدی برای شناخت میراث مکتوب شیعه و طرق دسترسی به آثار است. هر مدخل، نام مؤلف، فهرست تألیفات و سند روایت کتاب را گزارش می‌کند. این اثر، در ترکیب با رجال نجاشی و کشی، تصویری جامع از سنت حدیثی-رجالی شیعه فراهم می‌آورد.",
            i18n: {
              en: {
                title: "Al-Fihrist of al-Shaykh al-Tusi",
                brief_summary: "Al-Fihrist of al-Shaykh al-Tusi is a catalogue of Shi'i authors and their hadith and legal works together with the chains by which they were transmitted.",
                extended_content: "Al-Fihrist of al-Shaykh al-Tusi is one of the key sources for understanding the written heritage of the Shi'a and the routes by which their works reached us. Each entry records the author's name, his bibliography, and the chain through which the book is transmitted. Combined with the rijal works of al-Najashi and al-Kashshi, it offers a comprehensive picture of the Shi'i hadith–rijal tradition."
              }
            }
          },
          {
            slug: "kholase-allameh",
            title: "خلاصه علامه حلی",
            difficulty_level: :advanced,
            brief_summary: "«خلاصة الأقوال» علامه حلی، گزیده‌ای از منابع پیشین رجالی است که راویان را به دو بخش معتمدین و غیرمعتمدین تقسیم می‌کند.",
            extended_content: "خلاصه علامه حلی (Khulasat al-Aqwal) در سده هشتم هجری، نظام‌بندی تازه‌ای به مطالعات رجالی شیعه بخشید. تقسیم به «قسم اول» (موثقین) و «قسم دوم» (مردودین)، کاربری عملی این کتاب را برای فقیهان آسان ساخت. این اثر، مرحله انتقالی از منابع کهن به منابع متأخر رجالی است.",
            i18n: {
              en: {
                title: "Khulasat al-Aqwal of Allama al-Hilli",
                brief_summary: "Khulasat al-Aqwal by Allama al-Hilli distils the earlier rijal sources, sorting narrators into the trustworthy and the rejected.",
                extended_content: "Khulasat al-Aqwal of Allama al-Hilli, written in the eighth century AH, brought a fresh organisation to Shi'i rijal studies. Its division into a 'first part' (trustworthy) and 'second part' (rejected) made it a practical reference for jurists. The book stands as the transitional stage between the early rijal sources and the later ones."
              }
            }
          },
          {
            slug: "tanqih-mamaghani",
            title: "تنقیح المقال مامقانی",
            difficulty_level: :advanced,
            brief_summary: "«تنقیح المقال» شیخ عبدالله مامقانی، دایرة‌المعارف رجالی پرحجمی است که در سده چهاردهم هجری تألیف شده است.",
            extended_content: "تنقیح المقال مامقانی (Tanqih al-Maqal of al-Mamaqani) با گردآوری گسترده‌ی نقل‌ها از منابع پیشین و افزودن تحلیل‌های مفصل، تلاشی برای جمع‌بندی میراث رجالی شیعه است. این اثر، با اطناب خود، انتقاد متأخرین را برانگیخته و راه را برای پدید آمدن «معجم رجال الحدیث» خویی گشوده است.",
            i18n: {
              en: {
                title: "Tanqih al-Maqal of al-Mamaqani",
                brief_summary: "Tanqih al-Maqal by Shaykh Abdullah al-Mamaqani is a vast rijal encyclopaedia composed in the fourteenth century AH.",
                extended_content: "Tanqih al-Maqal of al-Mamaqani gathers an enormous body of citations from the earlier sources and adds extensive analysis, attempting to synthesise the Shi'i rijal heritage. Its prolixity has drawn criticism from later scholars and prepared the ground for the emergence of al-Khu'i's Mu'jam Rijal al-Hadith."
              }
            }
          },
          {
            slug: "moajam-khoei",
            title: "معجم رجال الحدیث خویی",
            difficulty_level: :advanced,
            brief_summary: "«معجم رجال الحدیث» آیت‌الله خویی، اثری است در ۲۴ جلد که با نگاهی انتقادی، احوال راویان را بازخوانی می‌کند.",
            extended_content: "معجم رجال الحدیث خویی (Mu'jam Rijal al-Hadith of al-Khu'i) در دوران معاصر، منبع اصلی پژوهش رجالی شیعه است. خویی با احتیاط، توثیقات عام را نقد می‌کند و بر توثیقات صریح تکیه دارد. شیوه ارجاع وی به منابع و تجمیع روایات هر راوی در ذیل نام او، استفاده از این اثر را برای محقق آسان می‌سازد.",
            i18n: {
              en: {
                title: "Mu'jam Rijal al-Hadith of al-Khu'i",
                brief_summary: "Ayatollah al-Khu'i's Mu'jam Rijal al-Hadith is a 24-volume work that critically re-examines the lives of the narrators.",
                extended_content: "Mu'jam Rijal al-Hadith of al-Khu'i is the principal contemporary reference for Shi'i rijal research. Al-Khu'i is cautious about general authentications and leans on explicit ones. His careful citation of sources and his practice of gathering each narrator's hadith under that narrator's name make the work especially usable for the researcher."
              }
            }
          },
          {
            slug: "kotob-arbaa",
            title: "کتب اربعه",
            difficulty_level: :advanced,
            brief_summary: "کتب اربعه، چهار مجموعه پایه حدیثی شیعه‌اند که در شکل‌گیری ادبیات رجالی نقش محوری داشته‌اند.",
            extended_content: "کتب اربعه (The Four Books) عبارت‌اند از: الکافی نوشته کلینی، من لا یحضره الفقیه از شیخ صدوق، تهذیب الاحکام و الاستبصار هر دو از شیخ طوسی. این چهار اثر، بزرگ‌ترین مرجع حدیثی شیعه‌اند و مطالعه راویان آن‌ها بخش بزرگی از سنت رجالی را شکل داده است. ارزیابی روایات این کتب، نیازمند تسلط بر طبقات راویان و اصول جرح و تعدیل است.",
            i18n: {
              en: {
                title: "The Four Books (al-Kutub al-Arba'a)",
                brief_summary: "The Four Books are the four foundational Shi'i hadith collections that have been central to the shaping of rijal literature.",
                extended_content: "The Four Books are al-Kafi by al-Kulayni, Man La Yahduruhu al-Faqih by al-Shaykh al-Saduq, and Tahdhib al-Ahkam and al-Istibsar both by al-Shaykh al-Tusi. These four works are the largest hadith reference of the Shi'a, and the study of their narrators has shaped much of the rijal tradition. Evaluating their reports demands command of the generational layers of narrators and the principles of jarh wa ta'dil."
              }
            }
          }
        ]
      },
      {
        slug: "derayah",
        name: "درایه",
        description: "دانش فهم محتوای حدیث و کشف معنای روایت در پرتو متن، سیاق و قرائن.",
        position: 2,
        color: "yellow-500",
        icon: "lightbulb",
        category_slug: "hadith-sciences",
        i18n: {
          en: {
            name: "Dirayah (Hadith Comprehension)",
            description: "The discipline of understanding the content of a hadith by attending to its text, context, and supporting indicators."
          }
        },
        concepts: [
          {
            slug: "tarif-derayah",
            title: "تعریف درایه",
            difficulty_level: :beginner,
            brief_summary: "درایه در اصطلاح، دانش فهم متن حدیث در برابر علم روایت است که به نقل لفظ می‌پردازد.",
            extended_content: "تعریف درایه (Definition of Dirayah) آن را به‌عنوان دانش حاشیه‌ای بر علم حدیث، اما بنیادی برای استنباط، معرفی می‌کند. در حالی که علم رجال به ناقل می‌نگرد و مصطلح به ساختار سند، درایه به محتوای متن و معنای آن می‌پردازد. این تعریف، چارچوب مفهومی ضروری برای ورود به مطالعه عمیق حدیث است.",
            i18n: {
              en: {
                title: "Definition of Dirayah",
                brief_summary: "Dirayah is the discipline of understanding the text of a hadith — set against riwayah, which concerns the transmission of its wording.",
                extended_content: "Definition of Dirayah presents it as an auxiliary to the hadith sciences yet foundational for legal reasoning. Where rijal looks at the narrator and mustalah looks at the structure of the chain, dirayah turns to the content of the text and its meaning. This definition supplies the conceptual frame needed for any deep study of hadith."
              }
            }
          },
          {
            slug: "mafhoom-derayah",
            title: "مفهوم درایه",
            difficulty_level: :beginner,
            brief_summary: "درایه، دانش فهم متن حدیث و درک پیام آن در برابر صرف نقل لفظی روایت است.",
            extended_content: "مفهوم درایه (Concept of Hadith Comprehension) در سنت اسلامی با حدیث مشهور «حدیثٌ تدریه خیر من ألفٍ ترویه» گره خورده است؛ یک حدیث که بفهمی، از هزار حدیث که تنها روایت کنی بهتر است. این دانش، در برابر علم روایت می‌ایستد و بر فهم معنا تکیه دارد. درایه، نقطه ورود به مطالعه روش‌های فهم حدیث و حل تعارض اخبار است.",
            i18n: {
              en: {
                title: "Concept of Hadith Comprehension",
                brief_summary: "Dirayah is the science of understanding the text of a hadith and grasping its message, as opposed to merely transmitting its wording.",
                extended_content: "The Concept of Hadith Comprehension is bound up with the famous saying 'one hadith you understand is better than a thousand you only transmit'. This science stands against the mere science of transmission and rests on understanding meaning. Dirayah is the entry point into the study of methods of understanding hadith and of resolving conflicting reports."
              }
            }
          },
          {
            slug: "ahammiyat-fahm-hadith",
            title: "اهمیت فهم حدیث",
            difficulty_level: :beginner,
            brief_summary: "فهم درست حدیث، شرط لازم بهره‌گیری از روایت در فقه، اخلاق و کلام است؛ بدون آن، نقل بی‌ثمر می‌ماند.",
            extended_content: "اهمیت فهم حدیث (Importance of Understanding Hadith) از این سرچشمه می‌گیرد که حدیث، گفتار معصومی است که در بافتی خاص بیان شده است. کاربست بدون فهم، خطر تفسیر سطحی، استنباط نادرست و حتی تعارض‌های موهوم را در پی دارد. این آگاهی، ورود به مهارت زبان‌شناختی و سیاقی فهم حدیث را ضروری می‌سازد.",
            i18n: {
              en: {
                title: "Importance of Understanding Hadith",
                brief_summary: "Understanding a hadith correctly is a precondition for using it in jurisprudence, ethics, or theology; without that, transmission bears no fruit.",
                extended_content: "The Importance of Understanding Hadith arises from the fact that a hadith is the speech of an infallible spoken in a specific setting. Applying it without understanding risks shallow interpretation, mistaken legal derivation, and even the appearance of conflicts where none exist. This awareness makes the linguistic and contextual skills of hadith comprehension indispensable."
              }
            }
          },
          {
            slug: "zaban-hadith",
            title: "زبان حدیث",
            difficulty_level: :intermediate,
            brief_summary: "زبان حدیث، شیوه بیانی ویژه‌ای است که از زبان عرف عرب، آرایه‌های ادبی و گاه نمادها بهره می‌گیرد.",
            extended_content: "زبان حدیث (Language of Hadith) آمیخته‌ای از زبان معیار، اصطلاحات شرعی، تعابیر عرفی و گاه استعاره است. توجه به این لایه‌های زبانی، فهم را از سطح به عمق می‌برد. به‌ویژه در روایات معارفی، فهم زبان نمادین معصومان، کلید گشودن لایه‌های پنهان متن است.",
            i18n: {
              en: {
                title: "Language of Hadith",
                brief_summary: "The language of hadith is a distinctive register that draws on common Arabic usage, literary devices, and at times symbolic speech.",
                extended_content: "Language of Hadith blends standard Arabic, religious technical terms, customary expressions, and occasional metaphor. Attending to these layers takes understanding from the surface to depth. In doctrinal reports especially, grasping the symbolic register of the infallibles is the key that unlocks the hidden layers of the text."
              }
            }
          },
          {
            slug: "loghat-shenasi-hadith",
            title: "لغت‌شناسی حدیث",
            difficulty_level: :intermediate,
            brief_summary: "لغت‌شناسی حدیث، بررسی معنای واژگان روایت بر پایه کاربرد آن‌ها در عصر صدور است.",
            extended_content: "لغت‌شناسی حدیث (Hadith Lexicography) از منابعی چون «النهایة فی غریب الحدیث و الأثر» ابن اثیر و «مجمع البحرین» طریحی بهره می‌گیرد. تغییر معنای واژه در طول تاریخ، یکی از دام‌های فهم حدیث است؛ مثلاً واژه‌ای که امروز معنایی دارد، در صدر اسلام معنایی متفاوت داشته است. این مهارت، شرط لازم درک متن کهن است.",
            i18n: {
              en: {
                title: "Hadith Lexicography",
                brief_summary: "Hadith lexicography studies the meaning of the words of a report in the usage current at the time it was uttered.",
                extended_content: "Hadith Lexicography draws on works such as Ibn al-Athir's al-Nihayah fi Gharib al-Hadith wa al-Athar and al-Turayhi's Majma' al-Bahrayn. Words shift in meaning over time, which is one of the standing pitfalls of hadith comprehension: a term carrying one sense today may have meant something different in the early Islamic centuries. The skill is a precondition for grasping any old text."
              }
            }
          },
          {
            slug: "gharib-alhadith",
            title: "غریب الحدیث",
            difficulty_level: :intermediate,
            brief_summary: "غریب الحدیث، شاخه‌ای از لغت‌شناسی است که به واژگان نامأنوس یا کم‌کاربرد در روایات می‌پردازد.",
            extended_content: "غریب الحدیث (Gharib al-Hadith) از سده دوم هجری مورد توجه قرار گرفت و آثاری چون «غریب الحدیث» ابوعبید قاسم بن سلام پدید آمد. این دانش، از خلط معنای امروزی با مراد گوینده جلوگیری می‌کند و درک دقیق سیاق حدیث را ممکن می‌سازد.",
            i18n: {
              en: {
                title: "Gharib al-Hadith (Rare Vocabulary)",
                brief_summary: "Gharib al-Hadith is a branch of lexicography devoted to the unfamiliar or rarely used words found in reports.",
                extended_content: "Gharib al-Hadith began to attract attention in the second century AH, with works such as Abu 'Ubayd Qasim ibn Sallam's Gharib al-Hadith. The discipline guards the reader against confusing today's senses with what the speaker actually meant, and makes precise grasp of a hadith's context possible."
              }
            }
          },
          {
            slug: "siyagh-hadith",
            title: "سیاق حدیث",
            difficulty_level: :intermediate,
            brief_summary: "سیاق حدیث، مجموعه قراین متنی و موقعیتی است که معنای روایت را در بستر آن می‌توان فهمید.",
            extended_content: "سیاق حدیث (Context of Hadith) شامل سیاق درونی متن (کلمات پیشین و پسین) و سیاق بیرونی (موقعیت صدور، پرسش راوی، روحیه مخاطب) است. غفلت از سیاق، گاه روایت را از مدلول اصلی خود خارج می‌سازد. این مهارت، نقطه عطفی در گذار از فهم سطحی به فهم عمیق روایت است.",
            i18n: {
              en: {
                title: "Context of Hadith",
                brief_summary: "Context (siyaq) is the body of textual and situational indicators against which a report is to be read.",
                extended_content: "Context of Hadith includes both internal context (the words preceding and following) and external context (the occasion of utterance, the narrator's question, the disposition of the addressee). Ignoring context can prise a report away from what it was originally meant to say. The skill marks the turn from a surface reading to a deep one."
              }
            }
          },
          {
            slug: "asbab-sodoor-hadith",
            title: "اسباب صدور حدیث",
            difficulty_level: :intermediate,
            brief_summary: "اسباب صدور، رویدادها و پرسش‌هایی است که موجب بیان یک روایت از سوی معصوم شده‌اند.",
            extended_content: "اسباب صدور حدیث (Occasions of Hadith) همانند شأن نزول قرآن، نقش بزرگی در فهم درست روایت دارد. آگاهی از این اسباب، تمایز میان معنای موقعیتی و معنای فراگیر روایت را روشن می‌کند و از تعمیم نادرست روایت‌های موردی جلوگیری می‌کند.",
            i18n: {
              en: {
                title: "Occasions of Hadith",
                brief_summary: "Asbab al-sudur are the events and questions that prompted an infallible to deliver a particular report.",
                extended_content: "Occasions of Hadith play the same role for hadith that occasions of revelation play for the Quran. Knowing them clarifies the distinction between a report's situational meaning and its enduring sense, and guards against over-generalising case-bound reports."
              }
            }
          },
          {
            slug: "ravayat-belmaena",
            title: "روایت بالمعنی",
            difficulty_level: :intermediate,
            brief_summary: "روایت بالمعنی، نقل حدیث با حفظ معنا و تغییر در الفاظ است، در برابر روایت بالفاظ.",
            extended_content: "روایت بالمعنی (Narration by Meaning) در شرایطی که راوی به دقت معنا اطمینان دارد و الفاظ معصوم را به یاد ندارد، جایز شمرده شده است؛ اما عالمان حدیث آن را زمینه‌ای برای خطا می‌دانند، به‌ویژه در روایات فقهی که هر واژه دلالت ویژه‌ای دارد. آگاهی از این پدیده، احتیاط در استنباط را تقویت می‌کند.",
            i18n: {
              en: {
                title: "Narration by Meaning",
                brief_summary: "Narration by meaning is the transmission of a hadith preserving its sense while altering the wording — as opposed to narration by exact wording.",
                extended_content: "Narration by Meaning is permitted when the narrator is sure of the sense but cannot recall the infallible's exact words; yet scholars regard it as a fertile source of error, especially in legal reports where each term carries a specific implication. Awareness of this phenomenon reinforces caution in legal derivation."
              }
            }
          },
          {
            slug: "ravesh-fahm-hadith",
            title: "روش‌های فهم حدیث",
            difficulty_level: :intermediate,
            brief_summary: "روش‌های فهم حدیث، شیوه‌های سامان‌مندی برای استخراج معنای درست روایت با توجه به متن، سیاق و قرائن است.",
            extended_content: "روش‌های فهم حدیث (Methods of Hadith Interpretation) از تحلیل لغوی واژگان روایت تا توجه به فضای صدور، پرسش راوی و سیاق گفت‌وگو را در بر می‌گیرد. در این روش‌ها، روایت در کنار قرآن و دیگر روایات سنجیده می‌شود تا فهم تک‌بعدی شکل نگیرد. این مهارت، بر مفهوم درایه استوار است و راه را برای حل تعارض میان روایات می‌گشاید.",
            i18n: {
              en: {
                title: "Methods of Hadith Interpretation",
                brief_summary: "Methods of interpretation are systematic ways of recovering the proper meaning of a hadith by attending to text, context, and indicators.",
                extended_content: "Methods of Hadith Interpretation cover everything from lexical analysis of the words of a report to attention to the setting of utterance, the narrator's question, and the conversational context. The report is also weighed against the Quran and against other reports so that no one-sided reading is allowed to harden. The skill rests on the concept of dirayah and opens the way to the resolution of conflict among reports."
              }
            }
          },
          {
            slug: "hadith-dar-partoo-quran",
            title: "حدیث در پرتو قرآن",
            difficulty_level: :intermediate,
            brief_summary: "روایت معتبر، آن است که با محکمات قرآن سازگار باشد؛ ناسازگاری با قرآن، نشانه ضعف یا حتی وضع روایت است.",
            extended_content: "حدیث در پرتو قرآن (Hadith in Light of the Quran) بر پایه روایات «عرض بر قرآن» شکل گرفته است؛ روایاتی که در آن‌ها معصومان فرموده‌اند هر حدیثی را بر قرآن عرضه کنید؛ آنچه موافق قرآن است بپذیرید و آنچه مخالف است را رد کنید. این اصل، معیار محکمی برای فهم حدیث در اختیار محقق می‌نهد.",
            i18n: {
              en: {
                title: "Hadith in Light of the Quran",
                brief_summary: "A reliable report must be consistent with the firm verses of the Quran; conflict with the Quran is a sign of weakness or even of fabrication.",
                extended_content: "Hadith in Light of the Quran rests on the 'measure-against-the-Quran' reports, in which the infallibles instructed Muslims to test every hadith against the Quran — to accept what agrees and reject what disagrees. This principle puts a firm criterion for hadith comprehension into the researcher's hand."
              }
            }
          },
          {
            slug: "naghshe-aghl",
            title: "نقش عقل در فهم حدیث",
            difficulty_level: :intermediate,
            brief_summary: "عقل، یکی از منابع فهم حدیث است؛ روایتی که با بدیهیات عقلی سازگار نباشد، مورد تردید قرار می‌گیرد.",
            extended_content: "نقش عقل در فهم حدیث (Role of Reason in Understanding Hadith) ریشه در روایات تأکیدآمیز معصومان بر جایگاه عقل دارد. عالمان شیعه، عقل را در کنار قرآن، سنت و اجماع، یکی از منابع چهارگانه استنباط می‌دانند. این نگاه، روش فهم حدیث را از تکیه صرف بر نقل بیرون می‌آورد.",
            i18n: {
              en: {
                title: "Role of Reason in Understanding Hadith",
                brief_summary: "Reason is one of the sources of hadith comprehension; a report at odds with self-evident rational truths is held in doubt.",
                extended_content: "The Role of Reason in Understanding Hadith is rooted in the infallibles' own emphatic reports about the standing of reason. Shi'i scholars treat reason — alongside the Quran, the Sunna, and consensus — as one of the four sources of legal derivation. The view rescues the method of hadith interpretation from sole reliance on transmission."
              }
            }
          },
          {
            slug: "tavil-hadith",
            title: "تأویل حدیث",
            difficulty_level: :intermediate,
            brief_summary: "تأویل حدیث، عبور از معنای ظاهری روایت به معنای باطنی یا غایت‌مند آن است.",
            extended_content: "تأویل حدیث (Esoteric Interpretation of Hadith) به‌ویژه در روایات معارفی، عرفانی و متشابه به کار می‌آید. این مهارت، اگر بدون ضابطه به کار رود، خطر تفسیر به رأی را پیش می‌آورد؛ اما با تکیه بر قراین قرآنی و عقلی، پنجره‌ای به لایه‌های ژرف‌تر متن می‌گشاید.",
            i18n: {
              en: {
                title: "Esoteric Interpretation of Hadith (Ta'wil)",
                brief_summary: "Ta'wil is the move from the apparent meaning of a report to its inner or purpose-oriented meaning.",
                extended_content: "Esoteric Interpretation of Hadith is most often invoked in doctrinal, mystical, and ambiguous reports. Used without discipline, the skill courts arbitrary 'interpretation by personal opinion'; but anchored in Quranic and rational indicators, it opens a window onto the deeper layers of the text."
              }
            }
          },
          {
            slug: "taarez-akhbar",
            title: "تعارض اخبار",
            difficulty_level: :intermediate,
            brief_summary: "تعارض اخبار، حالتی است که در آن دو یا چند روایت در ظاهر با یکدیگر ناسازگار به نظر می‌رسند.",
            extended_content: "تعارض اخبار (Conflict of Reports) با ابزارهایی چون جمع عرفی، ترجیح، تخییر و توقف بررسی می‌شود. عالمان حدیث می‌کوشند نخست با تأویل، تعارض را رفع کنند و در صورت ناتوانی، روایت قوی‌تر را ترجیح دهند. مرجحاتی مانند موافقت با قرآن، اشتهار میان راویان و موافقت با عقل به کار می‌آیند. این دانش، شاخه‌ای پیشرفته از فهم حدیث است که بر روش‌های فهم حدیث تکیه دارد.",
            i18n: {
              en: {
                title: "Conflict of Reports",
                brief_summary: "Conflict of reports is the situation in which two or more hadith appear, on the surface, to be at odds with one another.",
                extended_content: "Conflict of Reports is examined through reconciliation by common usage, preference, optionality, and suspension. Scholars first try to dissolve the conflict by interpretation; failing that, they prefer the stronger report. Preferences include agreement with the Quran, fame among narrators, and agreement with reason. The science is an advanced branch of hadith comprehension built on the methods of interpretation."
              }
            }
          },
          {
            slug: "jam-orfi",
            title: "جمع عرفی",
            difficulty_level: :advanced,
            brief_summary: "جمع عرفی، تلاش برای ترکیب دو روایت متعارض به گونه‌ای که از نگاه عرف، هر دو معتبر بمانند.",
            extended_content: "جمع عرفی (Reconciliation by Common Understanding) با شیوه‌هایی چون حمل عام بر خاص، مطلق بر مقید، و ظاهر بر اظهر صورت می‌گیرد. این روش، مقدم بر طرح روایت یا ترجیح است؛ زیرا اصل بر آن است که سخن معصوم بی‌جهت طرح نشود. تسلط بر این مهارت، کلید حل بسیاری از تعارض‌های ظاهری است.",
            i18n: {
              en: {
                title: "Reconciliation by Common Understanding",
                brief_summary: "Jam' 'urfi is the attempt to combine two conflicting reports so that both remain valid in the common understanding.",
                extended_content: "Reconciliation by Common Understanding is carried out through such moves as taking the general (`amm) in light of the specific (khass), the unrestricted (mutlaq) in light of the restricted (muqayyad), and the apparent in light of the more apparent. The approach takes priority over discarding a report or preferring one over another, since the principle is that an infallible's words are not to be discarded without cause. Mastery of this skill resolves many surface conflicts."
              }
            }
          },
          {
            slug: "tarjih-taarez",
            title: "ترجیح در تعارض",
            difficulty_level: :advanced,
            brief_summary: "ترجیح، گزینش یکی از دو روایت متعارض بر پایه مرجحات سندی، متنی یا برون‌متنی است.",
            extended_content: "ترجیح در تعارض (Preference in Conflict) زمانی به کار می‌آید که جمع عرفی ممکن نباشد. مرجحات گوناگون، رتبه‌بندی شده‌اند و در پاره‌ای موارد، ترجیح ممکن نیست و نوبت به تخییر یا توقف می‌رسد. این مفهوم، به فقیه نقشه‌ای برای کاربست نظام‌مند مرجحات می‌دهد.",
            i18n: {
              en: {
                title: "Preference in Conflict",
                brief_summary: "Tarjih is the choice of one of two conflicting reports on the basis of chain-, text-, or external preferences.",
                extended_content: "Preference in Conflict applies when reconciliation by common understanding is no longer available. The various preferences are themselves ranked, and in some cases preference is impossible and the turn comes to optionality or suspension. The concept gives the jurist a map for the systematic use of the preferences."
              }
            }
          },
          {
            slug: "morajjehat-sanadi",
            title: "مرجحات سندی",
            difficulty_level: :advanced,
            brief_summary: "مرجحات سندی، شامل وثاقت بیشتر راویان، تعدد طریق و اتصال بهتر سند است.",
            extended_content: "مرجحات سندی (Sanad-Based Preferences) در رتبه نخست، روایت با راوی موثق‌تر، تعدد بیشتر طرق نقل و اتصال کامل سند را بر روایت در نقطه مقابل ترجیح می‌دهند. این مرجحات، بنیاد در علم رجال دارند و حلقه پیوند درایه و رجال را روشن می‌سازند.",
            i18n: {
              en: {
                title: "Sanad-Based Preferences",
                brief_summary: "Sanad-based preferences include greater reliability of narrators, multiplicity of transmission paths, and a fully connected chain.",
                extended_content: "Sanad-Based Preferences favour, in the first rank, the report with the more reliable narrators, more numerous paths, and a fully connected chain over its opposing counterpart. These preferences rest on 'ilm al-rijal and make plain the connecting link between dirayah and rijal."
              }
            }
          },
          {
            slug: "morajjehat-matni",
            title: "مرجحات متنی",
            difficulty_level: :advanced,
            brief_summary: "مرجحات متنی، شامل موافقت با قرآن، عقل، اشتهار میان عالمان و سازگاری با اصول کلی شریعت است.",
            extended_content: "مرجحات متنی (Text-Based Preferences) از روایات «اعرضوهما علی کتاب الله» سرچشمه می‌گیرند. روایتی که موافق قرآن، شهرت یا عقل باشد، بر روایت مخالف ترجیح دارد. این مرجحات، بُعد محتوایی ترجیح را تقویت می‌کنند و درکنار مرجحات سندی، مجموعه‌ای منسجم می‌سازند.",
            i18n: {
              en: {
                title: "Text-Based Preferences",
                brief_summary: "Text-based preferences include agreement with the Quran, with reason, with the consensus of scholars, and with the broad principles of the Sharia.",
                extended_content: "Text-Based Preferences trace to the report 'measure them both against the Book of God'. A report that agrees with the Quran, with established usage, or with reason is preferred over the opposing one. These preferences reinforce the content-side of tarjih and, together with the sanad-based preferences, form a coherent toolkit."
              }
            }
          },
          {
            slug: "naskh-mansookh-hadith",
            title: "ناسخ و منسوخ در حدیث",
            difficulty_level: :advanced,
            brief_summary: "گاه روایتی، حکم روایت پیشینی را برمی‌دارد که در فقه با اصطلاحات ناسخ و منسوخ بررسی می‌شود.",
            extended_content: "ناسخ و منسوخ در حدیث (Abrogation in Hadith) شبیه نسخ در قرآن است و همواره نیازمند سند معتبر برای روایت ناسخ و آگاهی از ترتیب صدور است. شناسایی نسخ، گاه تعارض ظاهری دو روایت را به‌سادگی حل می‌کند و چارچوبی تاریخی به فهم متن می‌بخشد.",
            i18n: {
              en: {
                title: "Abrogation in Hadith (Nasikh and Mansukh)",
                brief_summary: "At times one report abrogates the ruling of an earlier one, which jurisprudence examines under the terms nasikh and mansukh.",
                extended_content: "Abrogation in Hadith is parallel to abrogation in the Quran and always demands a reliable chain for the abrogating report and clarity about the order in which the reports were uttered. Identifying abrogation can dissolve a surface conflict at once and supplies a historical frame for understanding the text."
              }
            }
          },
          {
            slug: "aam-khass-hadith",
            title: "عام و خاص در حدیث",
            difficulty_level: :advanced,
            brief_summary: "روایت عام، حکمی فراگیر بیان می‌کند و روایت خاص، آن را به موردی محدود تخصیص می‌دهد.",
            extended_content: "عام و خاص در حدیث (General and Specific in Hadith) از ابزارهای محوری جمع عرفی است. عالمان اصول، حمل عام بر خاص را قرینه‌ای روشن می‌دانند که از تعارض می‌کاهد. تسلط بر این تمایز، شرط لازم خوانش دقیق روایات فقهی است.",
            i18n: {
              en: {
                title: "General and Specific in Hadith",
                brief_summary: "A general report states a sweeping ruling; a specific report restricts it to a particular case.",
                extended_content: "General and Specific in Hadith is one of the central instruments of reconciliation by common understanding. Usul scholars treat reading the general in light of the specific as a clear indicator that defuses conflict. Mastery of the distinction is a prerequisite for any precise reading of legal hadith."
              }
            }
          },
          {
            slug: "motlaq-moghayyad",
            title: "مطلق و مقید در حدیث",
            difficulty_level: :advanced,
            brief_summary: "روایت مطلق، حکمی بی‌قید بیان می‌کند و روایت مقید، آن را به شرطی محدود می‌سازد.",
            extended_content: "مطلق و مقید در حدیث (Absolute and Restricted in Hadith) همانند عام و خاص، چارچوبی برای جمع عرفی فراهم می‌سازد. حمل مطلق بر مقید، در صورت اتحاد حکم و موضوع و تنافی میان دو روایت، اعمال می‌شود. این روش، فهم نظام‌مند روایات فقهی و اخلاقی را ممکن می‌سازد.",
            i18n: {
              en: {
                title: "Absolute and Restricted in Hadith",
                brief_summary: "An absolute report states a ruling without conditions; a restricted report binds it by a condition.",
                extended_content: "Absolute and Restricted in Hadith, like the general and the specific, supplies a framework for reconciliation by common understanding. Reading the absolute in light of the restricted is applied when the ruling and the topic are the same and the two reports are in tension. The technique makes a systematic reading of legal and ethical reports possible."
              }
            }
          },
          {
            slug: "mojmal-mobayyan",
            title: "مجمل و مبیّن در حدیث",
            difficulty_level: :advanced,
            brief_summary: "روایت مجمل، معنایی مبهم دارد و روایت مبیّن، آن ابهام را برطرف می‌سازد.",
            extended_content: "مجمل و مبیّن در حدیث (Ambiguous and Clarifying in Hadith) رابطه مکملی میان روایات نشان می‌دهد. شناسایی روایت مبیّن، شرط لازم درک معنای روایت مجمل است. این تمایز، فهم را از سطح ظاهری به ساختار کلی متن می‌برد.",
            i18n: {
              en: {
                title: "Ambiguous and Clarifying in Hadith",
                brief_summary: "An ambiguous (mujmal) report carries an opaque meaning; a clarifying (mubayyin) report removes that opacity.",
                extended_content: "Ambiguous and Clarifying in Hadith captures a complementary relationship between reports. Identifying the clarifying report is a prerequisite for grasping the ambiguous one. This distinction takes understanding from the surface to the broader textual structure."
              }
            }
          },
          {
            slug: "ravayate-taghye",
            title: "روایات تقیه‌ای",
            difficulty_level: :advanced,
            brief_summary: "روایات تقیه‌ای، روایاتی است که معصوم در شرایط حکومتی فشار، حکمی موافق نظر مخالف بیان فرموده است.",
            extended_content: "روایات تقیه‌ای (Hadiths of Dissimulation) در سنت شیعه به دلیل شرایط سیاسی خاص اهل بیت (ع) جایگاه مهمی دارند. شناسایی این روایات، نیازمند بررسی سیاق تاریخی و مقایسه با روایات روشن دیگر است. این مهارت، یکی از ابزارهای پیشرفته رفع تعارض اخبار است.",
            i18n: {
              en: {
                title: "Hadiths of Dissimulation (Taqiyya)",
                brief_summary: "Taqiyya reports are those in which an infallible, under political pressure, issued a ruling consonant with the opposing view.",
                extended_content: "Hadiths of Dissimulation occupy an important place in the Shi'i tradition because of the particular political circumstances of the Ahl al-Bayt (a). Identifying them calls for examination of the historical context and comparison with the clearer parallel reports. The skill is one of the advanced instruments for resolving conflict among reports."
              }
            }
          },
          {
            slug: "fiqh-alhadith",
            title: "فقه الحدیث",
            difficulty_level: :advanced,
            brief_summary: "فقه الحدیث، استنباط احکام و معارف از متن روایت با تکیه بر تمام مهارت‌های درایه است.",
            extended_content: "فقه الحدیث (Jurisprudence of Hadith) اوج کاربردی علم درایه است. در این مرحله، محقق با تسلط بر زبان، سیاق، تعارض، عام و خاص، مطلق و مقید، و دیگر ابزارها، حکم یا آموزه‌ای از روایت می‌گیرد. این مهارت، نشانه‌ی بلوغ علمی پژوهشگر حدیث است.",
            i18n: {
              en: {
                title: "Fiqh al-Hadith (Jurisprudence of Hadith)",
                brief_summary: "Fiqh al-hadith is the derivation of rulings and teachings from a hadith using the full toolkit of dirayah.",
                extended_content: "Fiqh al-Hadith is the practical summit of dirayah. At this stage the researcher, in command of language, context, conflict, the general and specific, the absolute and restricted, and the rest, derives a ruling or doctrine from the report. The skill is the mark of scholarly maturity in hadith research."
              }
            }
          },
          {
            slug: "hadith-mowzooi",
            title: "حدیث موضوعی",
            difficulty_level: :advanced,
            brief_summary: "حدیث موضوعی، شیوه‌ای پژوهشی است که روایات هم‌موضوع را گرد می‌آورد تا تصویری جامع از یک مفهوم به دست دهد.",
            extended_content: "حدیث موضوعی (Thematic Hadith Study) در دوران معاصر گسترش یافته و از روش‌های نوین پژوهش حدیثی است. در این رویکرد، پژوهشگر تمامی روایات مرتبط با یک موضوع — مانند توکل، عدالت یا تربیت — را گرد می‌آورد و با تکیه بر روش‌های فهم حدیث و حل تعارض اخبار، نظریه‌ای منسجم استخراج می‌کند. این روش، پلی میان حدیث‌پژوهی سنتی و علوم اجتماعی جدید است.",
            i18n: {
              en: {
                title: "Thematic Hadith Study",
                brief_summary: "Thematic hadith study is a research method that gathers reports on a single topic to assemble a comprehensive picture of one concept.",
                extended_content: "Thematic Hadith Study has expanded in the modern era and is among the newer methods of hadith research. The researcher gathers every report related to a single topic — such as trust in God, justice, or upbringing — and, drawing on the methods of hadith comprehension and conflict-resolution, derives a coherent account. The method is a bridge between traditional hadith scholarship and the modern social sciences."
              }
            }
          }
        ]
      },
      {
        slug: "hadith-history",
        name: "تاریخ حدیث",
        description: "مطالعه تطور تدوین، انتقال و سامان‌یابی حدیث در طول تاریخ اسلام.",
        position: 3,
        color: "red-500",
        icon: "scroll",
        category_slug: "hadith-sciences",
        i18n: {
          en: {
            name: "History of Hadith",
            description: "The study of how hadith was recorded, transmitted, and organised across Islamic history."
          }
        },
        concepts: [
          {
            slug: "hadith-asr-payambar",
            title: "حدیث در عصر پیامبر",
            difficulty_level: :beginner,
            brief_summary: "در عصر پیامبر (ص)، حدیث به‌صورت شفاهی و کتبی همزمان نقل می‌شد و صحابه به یادگیری آن اشتیاق داشتند.",
            extended_content: "حدیث در عصر پیامبر (Hadith in the Prophetic Era) در فضایی شکل گرفت که خود رسول خدا (ص) به ضبط دانش تشویق می‌کرد. مجالس درس، نشست‌های مسجد و سؤالات صحابه، بستر طبیعی نقل بود. شناخت این فضا، نقطه آغاز فهم تطور تاریخی حدیث است.",
            i18n: {
              en: {
                title: "Hadith in the Prophetic Era",
                brief_summary: "In the Prophet's lifetime hadith was conveyed both orally and in writing, and his Companions were eager to learn it.",
                extended_content: "Hadith in the Prophetic Era took shape in an atmosphere in which the Messenger of God (s) himself encouraged the recording of knowledge. Teaching circles, gatherings in the mosque, and the Companions' own questions were the natural setting for transmission. Recognising this setting is the starting point for understanding the historical development of hadith."
              }
            }
          },
          {
            slug: "ketabat-asr-nabavi",
            title: "کتابت در عهد نبوی",
            difficulty_level: :beginner,
            brief_summary: "در دوران پیامبر، شماری از صحابه به اجازه و تشویق ایشان، روایات را می‌نوشتند و آنچه به «صحیفه» مشهور بود، پدید آمد.",
            extended_content: "کتابت در عهد نبوی (Writing in the Prophetic Era) با آثار مکتوبی چون «صحیفه علی (ع)»، «صحیفه ابوهریره» و «صحیفه عبدالله بن عمرو بن عاص» نمود یافت. این صحیفه‌ها، نخستین گام در تدوین مکتوب حدیث بودند و افسانه پیوستگی منع کتابت در همه دوران را نقد می‌کنند.",
            i18n: {
              en: {
                title: "Writing in the Prophetic Era",
                brief_summary: "In the Prophet's lifetime, with his permission and encouragement, a number of Companions wrote down reports — producing the so-called sahifas.",
                extended_content: "Writing in the Prophetic Era is reflected in such written collections as the Sahifa of 'Ali (a), the Sahifa of Abu Hurayrah, and the Sahifa of 'Abdullah ibn 'Amr ibn al-'As. These sahifas were the first step in the written codification of hadith and refute the myth that the prohibition on writing applied unbroken across every era."
              }
            }
          },
          {
            slug: "man-tadvin-asr-kholafa",
            title: "منع تدوین در عهد خلفا",
            difficulty_level: :intermediate,
            brief_summary: "پس از رحلت پیامبر، در دوران خلیفه دوم، منع رسمی نوشتن حدیث اعلام شد و نقل شفاهی مدت‌ها رسمیت یافت.",
            extended_content: "منع تدوین در عهد خلفا (Prohibition of Codification in the Caliphal Era) برای حدود یک قرن پیامدهای جدی بر سنت حدیثی گذاشت. این سیاست، خطر فراموشی روایات را افزایش داد و ضمناً، در سده دوم هجری زمینه‌ساز برخی روایات جعلی شد. آگاهی از این مرحله، فهم اشتیاق بعدی برای تدوین را ممکن می‌سازد.",
            i18n: {
              en: {
                title: "Prohibition of Codification in the Caliphal Era",
                brief_summary: "After the Prophet's passing, an official prohibition on writing hadith was declared under the second caliph, and oral transmission held sway for a long time.",
                extended_content: "Prohibition of Codification in the Caliphal Era left serious marks on the hadith tradition for almost a century. The policy heightened the risk of reports being forgotten and, in the second century AH, also made room for some fabricated reports. Awareness of this stage is what makes the later eagerness to codify intelligible."
              }
            }
          },
          {
            slug: "hadith-asr-sahabah",
            title: "حدیث در عصر صحابه",
            difficulty_level: :intermediate,
            brief_summary: "در عصر صحابه، با وجود منع رسمی، نقل و گاه نوشتن خصوصی روایات ادامه یافت و علی (ع) بر اهمیت کتابت تأکید داشت.",
            extended_content: "حدیث در عصر صحابه (Hadith in the Era of Companions) دوره‌ای حساس از تاریخ حدیث است که در آن، احادیث پیامبر در سینه‌های اصحاب نگاه داشته می‌شد. در شیعه، صحیفه علی (ع) و کتاب فاطمه (س) از این دوران سخن می‌گویند. این مرحله، پل میان عصر نبوی و آغاز رسمی تدوین است.",
            i18n: {
              en: {
                title: "Hadith in the Era of the Companions",
                brief_summary: "In the era of the Companions, despite the official ban, transmission — and at times private writing — continued, and 'Ali (a) himself stressed the importance of writing.",
                extended_content: "Hadith in the Era of the Companions is a sensitive period in which the Prophet's reports were preserved in the breasts of his Companions. In the Shi'i tradition, the Sahifa of 'Ali (a) and the Mushaf of Fatima (s) speak of this era. The stage is the bridge between the Prophetic period and the formal beginning of codification."
              }
            }
          },
          {
            slug: "tadvin-hadith",
            title: "تدوین حدیث",
            difficulty_level: :beginner,
            brief_summary: "تدوین حدیث، فرآیند ثبت کتبی روایات پیامبر و امامان است که در سده‌های نخست اسلامی شکل گرفت.",
            extended_content: "تدوین حدیث (Codification of Hadith) در آغاز با موانعی روبه‌رو بود؛ منع کتابت در دوران برخی خلفا، انتقال شفاهی را مدت‌ها رواج داد. اما گروهی از صحابه و تابعین، روایات را در کراسه‌ها و اصول می‌نوشتند. این دوره، زمینه‌ساز ظهور مدارس حدیثی در شهرهای گوناگون اسلامی شد و نقطه آغاز هر مطالعه‌ای در تاریخ حدیث است.",
            i18n: {
              en: {
                title: "Codification of Hadith",
                brief_summary: "Codification is the process of committing the reports of the Prophet and the Imams to writing — a process that took shape in the first Islamic centuries.",
                extended_content: "Codification of Hadith met obstacles at first: the prohibition on writing under some of the caliphs kept oral transmission dominant for a long time. Even so, a number of Companions and Successors recorded reports in fascicles and 'usul (foundational booklets). This era set the stage for the emergence of hadith schools across the Islamic cities and is the starting point of any study of the history of hadith."
              }
            }
          },
          {
            slug: "asr-osool-hadithi",
            title: "عصر اصول حدیثی",
            difficulty_level: :intermediate,
            brief_summary: "عصر اصول حدیثی، دورانی است که در آن اصحاب امامان (ع) چهارصد اصل حدیثی نگاشتند که پایه کتب اربعه بعدی شد.",
            extended_content: "عصر اصول حدیثی (Era of Foundational Texts) در دوران امام صادق (ع) و امام کاظم (ع) به اوج رسید. در این دوره، شاگردان امامان، روایات را به‌صورت تخصصی و موضوعی گرد می‌آوردند. این مرحله، خشت‌های اصلی بنای حدیثی شیعه را گذاشت و ساختار جوامع بعدی را ممکن ساخت.",
            i18n: {
              en: {
                title: "Era of Foundational Texts",
                brief_summary: "The era of the foundational texts is the period in which the Imams' companions wrote the four hundred 'usul that became the basis of the later Four Books.",
                extended_content: "The Era of Foundational Texts reached its peak under Imam al-Sadiq (a) and Imam al-Kazim (a). In this period the Imams' students gathered reports thematically and by specialism. The stage laid the foundational bricks of the Shi'i hadith edifice and made the later major compilations structurally possible."
              }
            }
          },
          {
            slug: "zohor-madares-hadithi",
            title: "ظهور مدارس حدیثی",
            difficulty_level: :intermediate,
            brief_summary: "از سده دوم هجری، مدارس حدیثی در شهرهای گوناگون شکل گرفتند و هرکدام سنت ویژه‌ای پدید آوردند.",
            extended_content: "ظهور مدارس حدیثی (Emergence of Hadith Schools) محصول طبیعی گسترش جغرافیایی اسلام بود. مهاجرت اصحاب به سرزمین‌های جدید، موجب تبادل علمی و شکل‌گیری حلقه‌های درس در شهرهای بزرگ شد. این مدارس، ویژگی‌های منحصر به فرد در روش، منابع و محورهای موضوعی داشتند.",
            i18n: {
              en: {
                title: "Emergence of Hadith Schools",
                brief_summary: "From the second century AH, hadith schools formed in different cities, each developing its own distinctive tradition.",
                extended_content: "Emergence of Hadith Schools was the natural product of Islam's geographic spread. The Companions' migrations to new lands led to scholarly exchange and the formation of teaching circles in the great cities. These schools each developed distinctive methods, sources, and thematic emphases."
              }
            }
          },
          {
            slug: "madreseh-koofeh",
            title: "مدرسه کوفه",
            difficulty_level: :intermediate,
            brief_summary: "مدرسه کوفه، با حضور علی (ع) و شاگردان او، از مهم‌ترین مراکز نقل و تحلیل حدیث بود.",
            extended_content: "مدرسه کوفه (Kufa School) محل پرورش بسیاری از اصحاب امامان و راویان بزرگ شیعه بود. حضور افرادی چون اصبغ بن نباته، حارث همدانی و میثم تمار، این مدرسه را به یکی از قطب‌های حدیث بدل کرد. سنت کوفه، ادبیات حدیثی شیعه را به‌شدت تحت تأثیر قرار داد.",
            i18n: {
              en: {
                title: "The Kufa School",
                brief_summary: "Through the presence of 'Ali (a) and his students, the Kufa school was one of the most important centres of hadith transmission and analysis.",
                extended_content: "The Kufa School was the training ground of many of the Imams' companions and of the great Shi'i narrators. The presence of figures such as al-Asbagh ibn Nubata, al-Harith al-Hamadani, and Maytham al-Tammar made it a major hub of hadith learning. The Kufan tradition deeply shaped Shi'i hadith literature."
              }
            }
          },
          {
            slug: "madreseh-medina",
            title: "مدرسه مدینه",
            difficulty_level: :intermediate,
            brief_summary: "مدرسه مدینه، با حضور پیامبر و اهل بیت در آن دیار، خاستگاه نخستین نسل راویان حدیث است.",
            extended_content: "مدرسه مدینه (Medina School) با وجود امامان باقر و صادق (ع) و شاگردانی چون زراره و محمد بن مسلم، یکی از کانون‌های اصلی تعلیم حدیث بود. ویژگی این مدرسه، نزدیکی مستقیم به منبع وحی و توجه ویژه به فقه عملی بود.",
            i18n: {
              en: {
                title: "The Medina School",
                brief_summary: "Through the presence of the Prophet and the Ahl al-Bayt, Medina is the original homeland of the first generation of hadith narrators.",
                extended_content: "The Medina School, animated by the presence of Imams al-Baqir and al-Sadiq (a) and students such as Zurara and Muhammad ibn Muslim, was one of the principal centres of hadith instruction. Its hallmark was direct proximity to the source of revelation and a particular concern for practical jurisprudence."
              }
            }
          },
          {
            slug: "madreseh-qom",
            title: "مدرسه قم",
            difficulty_level: :intermediate,
            brief_summary: "مدرسه قم، از سده سوم هجری به یکی از قطب‌های اصلی حفظ و نقل حدیث شیعه بدل شد.",
            extended_content: "مدرسه قم (Qom School) با مهاجرت اشعریون از کوفه به قم پایه‌گذاری شد. عالمانی چون احمد بن محمد بن خالد برقی، علی بن ابراهیم قمی و محمد بن یحیی عطار، در این شهر بنیانگذار سنت روایی شدند که در «الکافی» کلینی به نقطه اوج خود رسید.",
            i18n: {
              en: {
                title: "The Qom School",
                brief_summary: "From the third century AH, the Qom school became one of the principal hubs for preserving and transmitting Shi'i hadith.",
                extended_content: "The Qom School was founded with the migration of the Ash'ari clan from Kufa to Qom. Scholars such as Ahmad ibn Muhammad ibn Khalid al-Barqi, 'Ali ibn Ibrahim al-Qummi, and Muhammad ibn Yahya al-'Attar founded a narrative tradition in this city that reached its summit in al-Kulayni's al-Kafi."
              }
            }
          },
          {
            slug: "madreseh-baghdad",
            title: "مدرسه بغداد",
            difficulty_level: :intermediate,
            brief_summary: "مدرسه بغداد، با حضور شیخ مفید و شیخ طوسی، محل تلفیق سنت حدیثی شیعه با کلام و فقه بود.",
            extended_content: "مدرسه بغداد (Baghdad School) در سده‌های چهارم و پنجم هجری، رویکردی نقدی‌تر و عقلی‌تر به حدیث پدید آورد. شیخ مفید با «المسائل السرویة» و شیخ طوسی با «التهذیب» و «الاستبصار»، چارچوب اجتهادی نوینی در رویارویی با روایات بنا کردند.",
            i18n: {
              en: {
                title: "The Baghdad School",
                brief_summary: "Through al-Shaykh al-Mufid and al-Shaykh al-Tusi, the Baghdad school fused the Shi'i hadith tradition with theology and jurisprudence.",
                extended_content: "The Baghdad School in the fourth and fifth centuries AH developed a more critical and rationally engaged approach to hadith. Al-Shaykh al-Mufid in al-Masa'il al-Sarawiyya and al-Shaykh al-Tusi in al-Tahdhib and al-Istibsar built a fresh ijtihadi framework for engaging the reports."
              }
            }
          },
          {
            slug: "madares-hadithi",
            title: "مدارس حدیثی",
            difficulty_level: :intermediate,
            brief_summary: "مدارس حدیثی، حوزه‌های جغرافیایی و فکری‌اند که هرکدام سنت ویژه‌ای در نقل و تحلیل روایت پدید آوردند.",
            extended_content: "مدارس حدیثی (Hadith Schools) در شهرهایی چون مدینه، کوفه، بصره، مکه، شام و قم شکل گرفتند. هر مدرسه، تحت تأثیر بزرگان همان دیار، اصول و روش‌های ویژه‌ای داشت؛ مدرسه کوفه با سنت اهل بیت پیوند نزدیک‌تری داشت و مدرسه قم در دوران غیبت نقش محوری در حفظ میراث حدیثی شیعه ایفا کرد. این مدارس، پل میان عصر تدوین حدیث و عصر تدوین جوامع حدیثی‌اند.",
            i18n: {
              en: {
                title: "Hadith Schools",
                brief_summary: "Hadith schools are geographic and intellectual centres, each of which developed a distinctive tradition of transmission and analysis.",
                extended_content: "Hadith Schools formed in cities such as Medina, Kufa, Basra, Mecca, the Levant, and Qom. Each school, shaped by the great scholars of its locale, developed its own principles and methods: the Kufa school maintained the closest tie to the tradition of the Ahl al-Bayt, while the Qom school played the central role in preserving the Shi'i hadith heritage during the era of Occultation. Together these schools form the bridge between the era of codification and the era of the great compilations."
              }
            }
          },
          {
            slug: "kolayni-kafi",
            title: "کلینی و الکافی",
            difficulty_level: :intermediate,
            brief_summary: "محمد بن یعقوب کلینی، با تألیف «الکافی»، نخستین جامع بزرگ حدیث شیعه را در سده چهارم هجری فراهم آورد.",
            extended_content: "کلینی و الکافی (Al-Kulayni and al-Kafi) محصول بیست سال تلاش این محدث بزرگ است. این اثر در سه بخش اصول، فروع و روضه، حدود ۱۶ هزار روایت را گرد آورده است. الکافی، نخستین کتاب از کتب اربعه و الگوی بسیاری از تألیفات بعدی حدیثی شیعه است.",
            i18n: {
              en: {
                title: "Al-Kulayni and al-Kafi",
                brief_summary: "Muhammad ibn Ya'qub al-Kulayni, with his al-Kafi, produced the first major comprehensive Shi'i hadith collection in the fourth century AH.",
                extended_content: "Al-Kulayni and al-Kafi was the fruit of twenty years' work by this great muhaddith. The work, in three parts — Usul, Furu', and Rawda — gathers some sixteen thousand reports. Al-Kafi is the first of the Four Books and the model for much of the later Shi'i hadith literature."
              }
            }
          },
          {
            slug: "sadooq-faqih",
            title: "صدوق و من لایحضره الفقیه",
            difficulty_level: :intermediate,
            brief_summary: "شیخ صدوق با تألیف «من لا یحضره الفقیه»، فقه روایی شیعه را در دسترس کسانی نهاد که به عالم دسترسی نداشتند.",
            extended_content: "صدوق و من لا یحضره الفقیه (Al-Saduq and Man La Yahduruhu al-Faqih) به‌گونه‌ای نگاشته شد که خواننده به فهم حکم شرعی برسد، حتی بدون مراجعه به مجتهد. صدوق، روایت‌های مورد اعتماد را گزینش کرد و سند آن‌ها را در پایان کتاب آورد. این اثر، دومین کتاب از کتب اربعه است.",
            i18n: {
              en: {
                title: "Al-Saduq and Man La Yahduruhu al-Faqih",
                brief_summary: "Al-Shaykh al-Saduq's Man La Yahduruhu al-Faqih put narrative Shi'i jurisprudence within reach of those without direct access to a scholar.",
                extended_content: "Al-Saduq and Man La Yahduruhu al-Faqih was written so that a reader could grasp a religious ruling even without consulting a mujtahid. Al-Saduq selected the reports he trusted and recorded their chains at the end of the book. The work is the second of the Four Books."
              }
            }
          },
          {
            slug: "tousi-kotob",
            title: "شیخ طوسی و کتب حدیثی",
            difficulty_level: :intermediate,
            brief_summary: "شیخ طوسی با تألیف «تهذیب الاحکام» و «الاستبصار»، دو اثر باقیمانده از کتب اربعه را فراهم آورد.",
            extended_content: "شیخ طوسی و کتب حدیثی (Al-Shaykh al-Tusi and His Hadith Works) در رویارویی با تعارض روایات، رویکردی اجتهادی پیش گرفت. «التهذیب» شرحی روایی بر «المقنعه» شیخ مفید است و «الاستبصار»، خلاصه‌ای از آن با تأکید بر روایات متعارض و راه‌حل آن‌هاست. این آثار، سومین و چهارمین کتاب از کتب اربعه‌اند.",
            i18n: {
              en: {
                title: "Al-Shaykh al-Tusi and His Hadith Works",
                brief_summary: "Al-Shaykh al-Tusi, with Tahdhib al-Ahkam and al-Istibsar, supplied the two remaining works of the Four Books.",
                extended_content: "Al-Shaykh al-Tusi and His Hadith Works adopt an ijtihadi approach to the conflict among reports. Al-Tahdhib is a hadith-based commentary on al-Shaykh al-Mufid's al-Muqni'a, and al-Istibsar is its précis with a focus on conflicting reports and their resolutions. These works are the third and fourth of the Four Books."
              }
            }
          },
          {
            slug: "asr-tadvin-javame",
            title: "عصر تدوین جوامع",
            difficulty_level: :intermediate,
            brief_summary: "عصر تدوین جوامع، دورانی است که در آن مجموعه‌های بزرگ و طبقه‌بندی‌شده حدیث پدید آمد.",
            extended_content: "عصر تدوین جوامع (Era of Major Compilations) در شیعه با تألیف کتب اربعه و در اهل سنت با ظهور صحاح سته شناخته می‌شود. این مجموعه‌ها، روایت‌های پراکنده مدارس حدیثی را در ساختاری موضوعی یا فقهی گرد آوردند و دسترسی محققان را تسهیل کردند. این مرحله، محصول طبیعی پیشرفت در مدارس حدیثی و نقطه عزیمت تطور علم حدیث است.",
            i18n: {
              en: {
                title: "Era of the Major Compilations",
                brief_summary: "The era of the major compilations is the period when large, systematically organised hadith collections came into being.",
                extended_content: "Era of the Major Compilations is identified in the Shi'i tradition with the composition of the Four Books and in the Sunni tradition with the appearance of the Six Authentic Books. These compilations gathered the scattered reports of the hadith schools into a thematic or legal architecture and made access easier for researchers. The stage is the natural outcome of progress in the hadith schools and the launching point for the further development of the science."
              }
            }
          },
          {
            slug: "sahah-setteh",
            title: "صحاح سته اهل سنت",
            difficulty_level: :intermediate,
            brief_summary: "صحاح سته، شش جامع معتبر حدیثی اهل سنت‌اند که از سده سوم هجری به این سو، مرجع روایی این مذهب شدند.",
            extended_content: "صحاح سته اهل سنت (The Six Authentic Books of Sunnis) عبارت‌اند از: صحیح بخاری، صحیح مسلم، سنن ابوداود، سنن ترمذی، سنن نسائی و سنن ابن ماجه. این مجموعه‌ها، ساختار حدیث‌محور فقه اهل سنت را شکل دادند و در طول تاریخ، شروح و حواشی فراوانی بر آن‌ها نگاشته شد.",
            i18n: {
              en: {
                title: "The Six Authentic Books of the Sunnis (al-Sihah al-Sittah)",
                brief_summary: "The Six Authentic Books are the six major Sunni hadith collections that, from the third century AH onward, became the narrative reference of that tradition.",
                extended_content: "The Six Authentic Books of the Sunnis are Sahih al-Bukhari, Sahih Muslim, Sunan Abu Dawud, Sunan al-Tirmidhi, Sunan al-Nasa'i, and Sunan Ibn Majah. These collections shaped the hadith-centred structure of Sunni jurisprudence, and a vast tradition of commentaries and glosses has been written on them through the centuries."
              }
            }
          },
          {
            slug: "sahih-bokhari",
            title: "صحیح بخاری",
            difficulty_level: :intermediate,
            brief_summary: "«الجامع الصحیح» محمد بن اسماعیل بخاری، نخستین و معتبرترین جامع حدیثی نزد اهل سنت است.",
            extended_content: "صحیح بخاری (Sahih al-Bukhari) ثمره‌ی شانزده سال کار بخاری است. وی از میان صدها هزار روایت، تنها حدود هفت هزار روایت را گزینش کرد. این اثر، با ساختار فقهی-موضوعی، الگوی صحاح بعدی شد و در سنت اهل سنت پس از قرآن، مقدس‌ترین کتاب شمرده می‌شود.",
            i18n: {
              en: {
                title: "Sahih al-Bukhari",
                brief_summary: "Al-Jami' al-Sahih of Muhammad ibn Isma'il al-Bukhari is the first and most authoritative comprehensive hadith collection among the Sunnis.",
                extended_content: "Sahih al-Bukhari is the fruit of sixteen years of al-Bukhari's labour. From hundreds of thousands of reports he selected about seven thousand. With its legal-thematic architecture, the work became the model for the later sahih collections and is regarded in the Sunni tradition as the most sanctified book after the Quran."
              }
            }
          },
          {
            slug: "sahih-moslem",
            title: "صحیح مسلم",
            difficulty_level: :intermediate,
            brief_summary: "«الجامع الصحیح» مسلم بن حجاج نیشابوری، دومین جامع معتبر اهل سنت است که با ساختاری روان‌تر از بخاری تألیف شد.",
            extended_content: "صحیح مسلم (Sahih Muslim) با تجمیع روایت‌های هم‌موضوع در یک جا، خوانش پژوهشی را آسان‌تر می‌سازد. مسلم، شاگرد بخاری بود و در گزینش روایات، شرایط ویژه خود را داشت. این اثر، در کنار صحیح بخاری به «صحیحین» مشهور است.",
            i18n: {
              en: {
                title: "Sahih Muslim",
                brief_summary: "Al-Jami' al-Sahih of Muslim ibn al-Hajjaj al-Naysaburi is the second authoritative Sunni compilation, with a smoother arrangement than al-Bukhari's.",
                extended_content: "Sahih Muslim, by collecting all reports on a single topic in one place, eases research-oriented reading. Muslim was a student of al-Bukhari and applied his own selection criteria. Together with Sahih al-Bukhari, the work is known as 'the two Sahihs'."
              }
            }
          },
          {
            slug: "asr-shorooh",
            title: "عصر شروح حدیثی",
            difficulty_level: :advanced,
            brief_summary: "از سده هفتم به این سو، عالمان به نگارش شروح مفصل بر کتب حدیثی پرداختند تا ابهامات و اختلافات را روشن سازند.",
            extended_content: "عصر شروح حدیثی (Era of Hadith Commentaries) با آثاری چون «فتح الباری» ابن حجر بر صحیح بخاری، «شرح صحیح مسلم» نووی، و در شیعه «مرآة العقول» علامه مجلسی بر الکافی، شکل گرفت. این شروح، گاه چندبرابر متن اصلی حجم دارند و میراثی غنی از تحلیل حدیثی پدید آورده‌اند.",
            i18n: {
              en: {
                title: "Era of Hadith Commentaries",
                brief_summary: "From the seventh century AH onward, scholars produced detailed commentaries on the hadith books to clear up obscurities and disagreements.",
                extended_content: "Era of Hadith Commentaries is marked by works such as Ibn Hajar's Fath al-Bari on Sahih al-Bukhari, al-Nawawi's commentary on Sahih Muslim, and — in the Shi'i tradition — Allama al-Majlisi's Mir'at al-'Uqul on al-Kafi. These commentaries are at times many times the size of the parent text and have produced a rich tradition of hadith analysis."
              }
            }
          },
          {
            slug: "majlesi-bahar",
            title: "مجلسی و بحار الانوار",
            difficulty_level: :advanced,
            brief_summary: "علامه محمد باقر مجلسی با تألیف «بحار الانوار»، بزرگ‌ترین موسوعه حدیثی شیعه را در ۱۱۰ جلد پدید آورد.",
            extended_content: "مجلسی و بحار الانوار (Al-Majlisi and Bihar al-Anwar) محصول دهه‌ها تلاش این عالم بزرگ صفوی است. وی با گردآوری روایات از منابع متقدم، بسیاری از کتب کم‌یاب را از خطر نابودی نجات داد. ساختار موضوعی بحار، آن را به مرجعی پایان‌ناپذیر در حدیث‌پژوهی شیعه تبدیل کرده است.",
            i18n: {
              en: {
                title: "Al-Majlisi and Bihar al-Anwar",
                brief_summary: "Allama Muhammad Baqir al-Majlisi, with Bihar al-Anwar, produced the largest Shi'i hadith encyclopaedia, in 110 volumes.",
                extended_content: "Al-Majlisi and Bihar al-Anwar are the fruit of decades of this great Safavid scholar's labour. By gathering reports from the early sources he saved many rare books from oblivion. Bihar's thematic architecture has made it an inexhaustible reference in Shi'i hadith research."
              }
            }
          },
          {
            slug: "asr-akhbari-osooli",
            title: "عصر اخباری و اصولی",
            difficulty_level: :advanced,
            brief_summary: "از سده یازدهم هجری، نزاع میان مکتب اخباری و اصولی در شیعه شکل گرفت که به نگاه به حدیث مربوط می‌شد.",
            extended_content: "عصر اخباری و اصولی (Era of Akhbari-Usuli Debate) با آثار محمد امین استرآبادی و در پاسخ، شیخ مرتضی انصاری، تحول مهمی در فهم حدیث پدید آورد. اخباریان، نقش عقل و اجتهاد را محدود می‌دانستند و اصولیان، اجتهاد را شرط فهم درست روایت می‌شمردند. پیروزی نسبی اصولیان، روش رایج امروز حوزه‌های شیعی را شکل داد.",
            i18n: {
              en: {
                title: "The Akhbari–Usuli Era",
                brief_summary: "From the eleventh century AH, a dispute formed within Shi'ism between the Akhbari and Usuli schools concerning the very approach to hadith.",
                extended_content: "Era of Akhbari-Usuli Debate, through the works of Muhammad Amin al-Astarabadi and the response of al-Shaykh Murtada al-Ansari, brought about an important shift in the understanding of hadith. The Akhbaris confined the role of reason and ijtihad; the Usulis treated ijtihad as a precondition for understanding a report correctly. The Usulis' relative victory shaped the methodology that prevails in today's Shi'i seminaries."
              }
            }
          },
          {
            slug: "mostashreghan-hadith",
            title: "مستشرقان و حدیث",
            difficulty_level: :advanced,
            brief_summary: "از سده نوزدهم میلادی، مستشرقانی چون گلدزیهر، شاخت و موتسکی به نقد تاریخی حدیث پرداختند.",
            extended_content: "مستشرقان و حدیث (Orientalists and Hadith) با رویکردهایی متفاوت از سنت اسلامی، روایات را از منظر تاریخ‌نگاری مدرن بررسی کردند. شکاکیت گلدزیهر و شاخت، با پاسخ‌های روش‌مندانه‌ی موتسکی و عالمان مسلمان معاصر روبه‌رو شد. این جریان، گفتمان نوینی در حدیث‌پژوهی پدید آورده است.",
            i18n: {
              en: {
                title: "Orientalists and Hadith",
                brief_summary: "From the nineteenth century onward, orientalists such as Goldziher, Schacht, and Motzki turned a historical-critical lens on hadith.",
                extended_content: "Orientalists and Hadith examined the reports through approaches distinct from those of the Islamic tradition, drawing on modern historiography. The scepticism of Goldziher and Schacht has been answered by the methodologically careful work of Motzki and by contemporary Muslim scholars. The current has opened a new register of discourse within hadith studies."
              }
            }
          },
          {
            slug: "hadith-pajoohi-moaaser",
            title: "حدیث‌پژوهی معاصر",
            difficulty_level: :advanced,
            brief_summary: "حدیث‌پژوهی معاصر، با بهره‌گیری از فناوری دیجیتال، تحلیل آماری و رویکردهای میان‌رشته‌ای، چهره‌ای نوین یافته است.",
            extended_content: "حدیث‌پژوهی معاصر (Contemporary Hadith Studies) با پایگاه‌های داده‌ای چون «نور الانوار»، «مکتبه اهل البیت» و ابزارهای جست‌وجوی پیشرفته، به محقق امکان می‌دهد روایات را در مقیاس وسیع تحلیل کند. مطالعات شبکه‌ای راویان، پردازش زبان طبیعی متون، و گفتمان‌کاوی روایات، از حوزه‌های نوظهورند.",
            i18n: {
              en: {
                title: "Contemporary Hadith Studies",
                brief_summary: "Contemporary hadith studies have taken on a new face through digital technology, statistical analysis, and interdisciplinary approaches.",
                extended_content: "Contemporary Hadith Studies, with databases such as Nur al-Anwar and Maktabat Ahl al-Bayt and with advanced search tools, let the researcher analyse reports at scale. Network analysis of narrators, natural-language processing of texts, and discourse analysis of reports are among the emerging fields."
              }
            }
          },
          {
            slug: "tatavor-elm-hadith",
            title: "تطور علم حدیث",
            difficulty_level: :advanced,
            brief_summary: "تطور علم حدیث، سیر دگرگونی روش‌ها، رویکردها و پرسش‌های حدیث‌پژوهی از آغاز تا دوران معاصر است.",
            extended_content: "تطور علم حدیث (Evolution of Hadith Sciences) از حفظ شفاهی و کتابت آغازین تا ظهور علوم رجال، درایه و مصطلح، و سرانجام رویکردهای انتقادی و مطالعات تطبیقی معاصر را در بر می‌گیرد. در دوران مدرن، روش‌های زبان‌شناختی، تاریخی‌نگارانه و دیجیتال نیز در خدمت این دانش قرار گرفته‌اند. درک این تطور، نیازمند آگاهی از عصر تدوین جوامع و تاریخ مدارس حدیثی است.",
            i18n: {
              en: {
                title: "Evolution of the Hadith Sciences",
                brief_summary: "The evolution of the hadith sciences traces the changing methods, approaches, and questions of hadith research from its beginnings to the present day.",
                extended_content: "Evolution of the Hadith Sciences runs from oral preservation and the earliest writing through the rise of rijal, dirayah, and mustalah, and finally to the modern critical and comparative approaches. In the modern era, linguistic, historiographic, and digital methods have been put to the service of the discipline. Grasping this evolution requires familiarity with the era of major compilations and with the history of the hadith schools."
              }
            }
          }
        ]
      }
    ].freeze
  end
end
