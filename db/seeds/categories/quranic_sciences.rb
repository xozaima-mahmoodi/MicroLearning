module SeedData
  module QuranicSciences
    CATEGORY = {
      slug: "quranic-sciences",
      title: "علوم قرآنی",
      position: 0,
      color: "emerald-gold",
      icon: "library",
      i18n: {
        en: { title: "Quranic Sciences" }
      }
    }.freeze

    DOMAINS = [
      {
        slug: "tafsir",
        name: "تفسیر",
        description: "دانش بیان معانی آیات قرآن کریم و کشف مقاصد الهی از کلام وحی.",
        position: 0,
        color: "emerald-500",
        icon: "book-open",
        category_slug: "quranic-sciences",
        i18n: {
          en: {
            name: "Tafsir (Exegesis)",
            description: "The discipline of clarifying the meanings of the Quran and uncovering its divine intent."
          }
        },
        concepts: [
          {
            slug: "mabani-tafsir",
            title: "مبانی تفسیر",
            difficulty_level: :beginner,
            brief_summary: "مبانی تفسیر، پیش‌فرض‌ها و اصول بنیادینی است که هر مفسر برای فهم درست آیات قرآن بدان‌ها تکیه می‌کند.",
            extended_content: "مبانی تفسیر (Foundations of Exegesis) شامل اصولی است درباره ماهیت قرآن، حجیت ظواهر، امکان فهم کلام الهی و رابطه عقل و نقل در تفسیر. مفسر پیش از ورود به متن باید موضع خود را در باب وحیانی بودن قرآن، عصمت گوینده و قابل فهم بودن مراد الهی روشن کند. این مبانی، چارچوب نظری ضروری ورود به مطالعه روش‌های تفسیری و دیگر دانش‌های قرآنی است.",
            i18n: {
              en: {
                title: "Foundations of Exegesis",
                brief_summary: "The foundational assumptions and principles every exegete relies on to understand the verses of the Quran correctly.",
                extended_content: "Foundations of Exegesis covers principles about the nature of the Quran, the authority of its apparent meanings, the possibility of grasping divine speech, and the relationship between reason and transmitted reports. Before engaging the text, an exegete must clarify their position on the revealed character of the Quran, the infallibility of the Speaker, and the intelligibility of the divine intent. These foundations form the theoretical frame required to enter the study of exegetical methods and the other Quranic disciplines."
              }
            }
          },
          {
            slug: "ravesh-tafsir",
            title: "روش‌های تفسیری",
            difficulty_level: :intermediate,
            brief_summary: "روش‌های تفسیری، شیوه‌های گوناگونی است که مفسران برای کشف مراد الهی از آیات قرآن به کار می‌گیرند.",
            extended_content: "روش‌های تفسیری (Exegetical Methods) از تفسیر قرآن به قرآن، تفسیر روایی و تفسیر اجتهادی تا تفسیر ادبی، تفسیر علمی، تفسیر اجتماعی و تفسیر موضوعی گسترده‌اند. هر روش بر منبع و معیار خاصی تکیه دارد؛ برخی متن‌محور و برخی مخاطب‌محورند. شناخت این روش‌ها بر مبانی تفسیر استوار است و راه ورود به فهم تخصصی شأن نزول و تفسیر تطبیقی را می‌گشاید.",
            i18n: {
              en: {
                title: "Exegetical Methods",
                brief_summary: "The varied methods exegetes use to uncover the divine intent of the Quranic verses.",
                extended_content: "Exegetical Methods range from Quran-by-Quran interpretation, narration-based exegesis and reasoned exegesis to literary, scientific, social and thematic approaches. Each method rests on its own sources and criteria; some are text-centred, others audience-centred. Mastery of these methods builds on the Foundations of Exegesis and opens the door to specialised study of Occasions of Revelation and Comparative Exegesis."
              }
            }
          },
          {
            slug: "shaan-nozool",
            title: "شأن نزول",
            difficulty_level: :intermediate,
            brief_summary: "شأن نزول، رویداد یا پرسشی است که نزول یک آیه یا گروهی از آیات در پی آن واقع شده است.",
            extended_content: "شأن نزول (Occasion of Revelation) از مهم‌ترین قراین تاریخی برای فهم سیاق آیه است و به مفسر کمک می‌کند تا میان معنای محدود به موقعیت نخستین و معنای فراگیر آیه تمایز نهد. این دانش بر منابع روایی استوار است و نقد سند و متن روایات شأن نزول، خود دانشی فرعی پدید آورده است. تسلط بر روش‌های تفسیری، پیش‌نیاز به‌کارگیری درست شأن نزول است.",
            i18n: {
              en: {
                title: "Occasion of Revelation",
                brief_summary: "The event or question that prompted the revelation of a verse or group of verses.",
                extended_content: "Occasion of Revelation is one of the most important historical clues for grasping a verse's context, helping the exegete distinguish a meaning bounded to its original setting from the verse's enduring sense. The discipline rests on narrated sources, and critique of the chains and texts of these reports has itself grown into a sub-discipline. A solid grasp of Exegetical Methods is a prerequisite for using Occasions of Revelation responsibly."
              }
            }
          },
          {
            slug: "tafsir-tatbighi",
            title: "تفسیر تطبیقی",
            difficulty_level: :advanced,
            brief_summary: "تفسیر تطبیقی، مقایسه نظام‌مند دیدگاه‌های مفسران مختلف درباره یک آیه یا موضوع قرآنی است.",
            extended_content: "تفسیر تطبیقی (Comparative Exegesis) با کنار هم نهادن تفاسیر فریقین، مذاهب گوناگون یا مکاتب کلامی متفاوت، نقاط اشتراک و افتراق آن‌ها را آشکار می‌کند. این رویکرد، توان تحلیلی مفسر را افزایش می‌دهد و او را از تک‌نگری می‌رهاند. تفسیر تطبیقی نیازمند تسلط بر روش‌های تفسیری، آگاهی از شأن نزول و فهم پس‌زمینه کلامی هر مفسر است.",
            i18n: {
              en: {
                title: "Comparative Exegesis",
                brief_summary: "The systematic comparison of different exegetes' views on a single Quranic verse or theme.",
                extended_content: "Comparative Exegesis sets the commentaries of the two main schools, multiple denominations, or rival theological traditions side by side and surfaces their points of agreement and divergence. The approach sharpens the exegete's analytical reach and frees them from a single-perspective reading. It presupposes mastery of Exegetical Methods, awareness of Occasions of Revelation, and an understanding of each exegete's theological background."
              }
            }
          }
        ]
      },
      {
        slug: "quran-recitation",
        name: "علوم قرائات",
        description: "مطالعه شیوه‌های گوناگون خواندن قرآن و قواعد ادای صحیح کلمات وحی.",
        position: 1,
        color: "amber-500",
        icon: "mic",
        category_slug: "quranic-sciences",
        i18n: {
          en: {
            name: "Quranic Recitation",
            description: "The study of the various ways the Quran is recited and the rules for pronouncing its words correctly."
          }
        },
        concepts: [
          {
            slug: "tajvid",
            title: "تجوید",
            difficulty_level: :beginner,
            brief_summary: "تجوید، دانش ادای صحیح حروف قرآن از مخارج آن و رعایت صفات حروف هنگام تلاوت است.",
            extended_content: "تجوید (Tajweed) قواعدی را در بر می‌گیرد که بر مخارج حروف، صفات لازم و عارض حروف، احکام نون ساکن و تنوین، احکام میم ساکن، مدّ و قصر و مانند آن‌ها متمرکز است. هدف تجوید، حفظ کلام وحی از تحریف لفظی در تلاوت است. تسلط بر تجوید، نقطه ورود به دانش‌های پیشرفته‌تر قرائت مانند قرائات سبعه و وقف و ابتدا است.",
            i18n: {
              en: {
                title: "Tajweed",
                brief_summary: "The discipline of pronouncing the letters of the Quran from their proper articulation points and observing their characteristics during recitation.",
                extended_content: "Tajweed encompasses rules covering the articulation points of letters, their essential and incidental qualities, the rulings on the silent nun and tanwin, the silent mim, elongation and shortening, and similar topics. Its aim is to preserve revealed speech from verbal corruption during recitation. Command of Tajweed is the entry point to more advanced recitation disciplines such as the Seven Readings and the rules of Pause and Start."
              }
            }
          },
          {
            slug: "gharaat-sabeh",
            title: "قرائات سبعه",
            difficulty_level: :intermediate,
            brief_summary: "قرائات سبعه، هفت قرائت مشهور قرآن است که از سوی هفت قاری برجسته نقل شده و سند متواتر دارد.",
            extended_content: "قرائات سبعه (The Seven Readings) به قرائت‌های نافع، ابن‌کثیر، ابوعمرو، ابن‌عامر، عاصم، حمزه و کسایی اشاره دارد. ابن مجاهد در سده چهارم هجری این هفت قرائت را گرد آورد و دیگر قاریان نیز هرکدام دو راوی مشهور دارند. مطالعه این قرائات، تنوع لفظی قرآن را در عین یکپارچگی پیام آن نشان می‌دهد و بر شالوده تجوید استوار است.",
            i18n: {
              en: {
                title: "The Seven Readings",
                brief_summary: "Seven well-known recitations of the Quran transmitted by seven prominent reciters with mass-transmitted chains.",
                extended_content: "The Seven Readings refer to the recitations of Nafi', Ibn Kathir, Abu Amr, Ibn Amir, Asim, Hamza and al-Kisai. Ibn Mujahid gathered these seven readings in the 4th century AH, and each reciter is preserved through two well-known transmitters. Studying these readings reveals the verbal variety of the Quran while preserving the unity of its message, and rests on a foundation of Tajweed."
              }
            }
          },
          {
            slug: "vaghf-ebteda",
            title: "وقف و ابتدا",
            difficulty_level: :intermediate,
            brief_summary: "وقف و ابتدا، دانش جای ایستادن و آغازیدن در تلاوت قرآن است که با معنای آیات گره خورده است.",
            extended_content: "وقف و ابتدا (Pause and Start) از قاری می‌خواهد چنان بایستد و آغاز کند که معنای آیه آسیب نبیند. علامای این دانش، وقف‌ها را به انواع لازم، جایز، حسن، کافی، تام و قبیح تقسیم کرده‌اند. این مهارت، رابطه‌ای دوسویه با فهم تفسیری دارد؛ زیرا تشخیص وقف مناسب نیازمند درک معنا و قرائت صحیح بر پایه قرائات سبعه است."
          },
          {
            slug: "ekhtelaf-gharaat",
            title: "اختلاف قرائات",
            difficulty_level: :advanced,
            brief_summary: "اختلاف قرائات، بررسی تطبیقی تفاوت‌های لفظی میان قرائات گوناگون و دلالت‌های معنایی آن‌هاست.",
            extended_content: "اختلاف قرائات (Variant Readings) شامل تحلیل اسناد، توجیه ادبی و دلالت‌های فقهی و کلامی هر اختلاف است. این دانش به مرز میان نقد متن، بلاغت و فقه‌اللغه راه می‌برد و گاهی در استنباط احکام شرعی نیز نقش می‌آفریند. مطالعه پیشرفته آن، تسلط بر قرائات سبعه و وقف و ابتدا را پیش‌فرض می‌گیرد."
          }
        ]
      },
      {
        slug: "quran-history",
        name: "تاریخ قرآن",
        description: "مطالعه فرآیند نزول، ثبت، گردآوری و انتقال متن قرآن کریم در طول تاریخ اسلام.",
        position: 2,
        color: "orange-500",
        icon: "history",
        category_slug: "quranic-sciences",
        i18n: {
          en: {
            name: "History of the Quran",
            description: "The study of how the Quran was revealed, recorded, compiled, and transmitted across Islamic history."
          }
        },
        concepts: [
          {
            slug: "ketabat-vahy",
            title: "کتابت وحی",
            difficulty_level: :beginner,
            brief_summary: "کتابت وحی، فرآیند ثبت آیات قرآن در روزگار پیامبر اسلام (ص) به دست کاتبان وحی است.",
            extended_content: "کتابت وحی (Writing of Revelation) از همان آغاز بعثت آغاز شد؛ پیامبر اسلام (ص) شماری از صحابه را به نوشتن آیات می‌گماشت. کاتبان وحی، آیات را بر روی موادی چون پوست، استخوان شانه شتر، سنگ‌های نازک و برگ‌های خرما ثبت می‌کردند. این مرحله، شالوده‌ای فراهم کرد که جمع و تدوین قرآن در سال‌های پس از رحلت پیامبر بر آن استوار شود.",
            i18n: {
              en: {
                title: "Writing of Revelation",
                brief_summary: "The process of recording the verses of the Quran in the Prophet's time by the scribes of revelation.",
                extended_content: "Writing of Revelation began with the start of the prophetic mission; the Prophet (peace be upon him) appointed a number of companions to write the verses down. These scribes recorded the verses on materials such as parchment, camel scapulae, thin stones and palm leaves. This phase laid the foundation on which the Compilation of the Quran in the years after the Prophet's passing would rest."
              }
            }
          },
          {
            slug: "jam-tadvin",
            title: "جمع و تدوین قرآن",
            difficulty_level: :intermediate,
            brief_summary: "جمع و تدوین قرآن، فرآیند گردآوری آیات پراکنده در یک مصحف واحد پس از رحلت پیامبر اسلام (ص) است.",
            extended_content: "جمع و تدوین قرآن (Compilation of the Quran) در عصر ابوبکر و به پیشنهاد عمر بن خطاب آغاز شد و زید بن ثابت، که از کاتبان وحی بود، مأمور این کار گردید. او با تکیه بر نوشته‌های موجود و حافظه قاریان، نخستین مصحف رسمی را فراهم آورد. این مرحله، در پی شهادت شمار زیادی از حافظان قرآن در نبرد یمامه ضرورت یافت و راه را برای توحید مصاحف در عصر عثمان گشود."
          },
          {
            slug: "masahef-sahabah",
            title: "مصاحف صحابه",
            difficulty_level: :intermediate,
            brief_summary: "مصاحف صحابه، نسخه‌های شخصی‌ای از قرآن است که برخی صحابه پیش یا پس از جمع رسمی برای خود فراهم آورده بودند.",
            extended_content: "مصاحف صحابه (Companion Codices) از جمله مصحف ابیّ بن کعب، عبدالله بن مسعود و علی بن ابی‌طالب (ع) شامل ترتیب سور، رسم‌الخط و گاه قرائت‌های ویژه‌ای بود. مطالعه این مصاحف، اطلاعات ارزشمندی درباره مرحله گذار از کتابت وحی به جمع و تدوین قرآن فراهم می‌آورد و بستر فهم تاریخی توحید مصاحف را می‌سازد."
          },
          {
            slug: "towhid-masahef",
            title: "توحید مصاحف",
            difficulty_level: :advanced,
            brief_summary: "توحید مصاحف، اقدام عثمان بن عفان برای یکسان‌سازی مصاحف مسلمانان و جلوگیری از اختلاف در متن قرآن است.",
            extended_content: "توحید مصاحف (Unification of Codices) در سده اول هجری در پی گزارش‌هایی از اختلاف قرائات در سرزمین‌های نوگشوده انجام شد. عثمان بر پایه مصحف ابوبکر و با حضور هیئتی به ریاست زید بن ثابت، چند نسخه رسمی فراهم آورد و به مراکز اسلامی فرستاد و مصاحف ناهمسان را از میان برداشت. این اقدام، نقطه عطف تاریخ قرآن است و بر بستر جمع و تدوین قرآن و مصاحف صحابه معنا می‌یابد."
          }
        ]
      },
      {
        slug: "quran-miracle",
        name: "اعجاز قرآن",
        description: "مطالعه ابعاد گوناگون اعجاز قرآن کریم که آن را از سخن بشری متمایز می‌سازد.",
        position: 3,
        color: "yellow-500",
        icon: "sparkles",
        category_slug: "quranic-sciences",
        i18n: {
          en: {
            name: "Inimitability of the Quran",
            description: "The study of the various dimensions of the Quran's inimitability that set it apart from human speech."
          }
        },
        concepts: [
          {
            slug: "mafhoom-eaejaz",
            title: "مفهوم اعجاز",
            difficulty_level: :beginner,
            brief_summary: "اعجاز قرآن، آن ویژگی‌ای است که قرآن را از تقلید و معارضه به دست بشر فراتر می‌برد.",
            extended_content: "مفهوم اعجاز (Concept of Inimitability) بر اصل تحدّی استوار است؛ قرآن کریم بارها مخالفان را به آوردن همانند خود، ده سوره یا حتی یک سوره فراخوانده و آنان از پاسخ ناتوان مانده‌اند. اعجاز، مفهومی چندوجهی است و وجوه ادبی، علمی، تشریعی، تاریخی و عددی برای آن برشمرده‌اند. درک این مفهوم بنیادین، نقطه ورود به مطالعه تخصصی هر یک از وجوه اعجاز است.",
            i18n: {
              en: {
                title: "Concept of Inimitability",
                brief_summary: "The Quran's inimitability is the quality that places it beyond human imitation or rivalry.",
                extended_content: "The Concept of Inimitability rests on the principle of challenge: the Quran repeatedly invited its opponents to produce something like it, then ten chapters, then even a single chapter, and they were unable to respond. Inimitability is a many-sided notion, with literary, scientific, legal, historical and numerical dimensions identified for it. Grasping this foundational concept is the entry point for the specialised study of each of those dimensions."
              }
            }
          },
          {
            slug: "eaejaz-bayani",
            title: "اعجاز بیانی",
            difficulty_level: :intermediate,
            brief_summary: "اعجاز بیانی، برتری ساختار لفظی، فصاحت و بلاغت قرآن نسبت به برترین نمونه‌های سخن عرب است.",
            extended_content: "اعجاز بیانی (Rhetorical Inimitability) از سوی کسانی چون باقلانی، جرجانی و رمانی بررسی شده است. این وجه از اعجاز، گزینش بی‌بدیل واژگان، نظم منحصر به فرد آیات، هماهنگی موسیقایی و تناسب میان لفظ و معنا را در بر می‌گیرد. این وجه، نخستین و مشهورترین وجه اعجاز است و بر مفهوم بنیادی اعجاز و آشنایی با ادب عرب استوار است."
          },
          {
            slug: "eaejaz-elmi",
            title: "اعجاز علمی",
            difficulty_level: :intermediate,
            brief_summary: "اعجاز علمی، اشاره قرآن به حقایقی از جهان طبیعت است که در روزگار نزول دانسته نبود و دانش جدید آن را آشکار کرد.",
            extended_content: "اعجاز علمی (Scientific Inimitability) از سده‌های میانه تاکنون مورد توجه بوده و در دوران معاصر گسترش یافته است. اشاره به مراحل پیدایش جنین، گسترش جهان، تاریکی اعماق دریا و چرخه آب از نمونه‌های مشهور آن است. این رویکرد نیازمند احتیاط روش‌شناختی است تا میان تطبیق علمی استوار و تأویل‌های شتاب‌زده تفاوت گذاشته شود و بر فهم درست مفهوم اعجاز تکیه دارد."
          },
          {
            slug: "eaejaz-adadi",
            title: "اعجاز عددی",
            difficulty_level: :advanced,
            brief_summary: "اعجاز عددی، کشف نظم و تناسب‌های شگفت‌انگیز عددی در ساختار حروف، واژگان و آیات قرآن است.",
            extended_content: "اعجاز عددی (Numerical Inimitability) با کارهای پژوهشگرانی چون عبدالرزاق نوفل و رشاد خلیفه شناخته‌تر شد. این رویکرد بر تکرار نظام‌مند برخی واژگان، نسبت‌های عددی میان مفاهیم متضاد و الگوهای عدد هفت و نوزده تأکید می‌کند. این حوزه نیازمند نقد روش‌شناختی جدی است؛ زیرا برخی ادعاها به آمار سلیقه‌ای می‌انجامند. مطالعه آن، اعجاز بیانی و علمی را به ساحتی نوین گسترش می‌دهد."
          }
        ]
      }
    ].freeze
  end
end
