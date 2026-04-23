# Seed idempotently with find_or_create_by! so re-running is safe.

CATEGORIES = [
  { slug: "social-sciences",   title: "علوم اجتماعی",         position: 0, color: "blue-500",   icon: "layers" },
  { slug: "humanities",        title: "علوم انسانی اصیل",     position: 1, color: "emerald-500", icon: "feather" },
  { slug: "interdisciplinary", title: "مطالعات میان‌رشته‌ای", position: 2, color: "purple-500",  icon: "network" }
]

DOMAINS = [
  # ---------- Social Sciences ----------
  {
    slug: "psychology",
    name: "روانشناسی",
    description: "مطالعه ذهن، رفتار و فرآیندهای شناختی انسان.",
    position: 0,
    color: "violet-500",
    icon: "brain",
    category_slug: "social-sciences",
    concepts: [
      {
        slug: "zehn-agahi",
        title: "ذهن‌آگاهی",
        difficulty_level: :beginner,
        brief_summary: "ذهن‌آگاهی، آگاهی لحظه‌به‌لحظه و بدون قضاوت از تجربه درونی و بیرونی است.",
        extended_content: "ذهن‌آگاهی (Mindfulness) تمرینی است که ریشه در سنت‌های مراقبه دارد و در روانشناسی مدرن برای کاهش استرس و افزایش بهزیستی به کار می‌رود. اصل بنیادین آن، آوردن توجه به زمان حال و پذیرش تجربه بدون واکنش خودکار است. این مفهوم شالوده‌ای برای درک شناخت اجتماعی، سوگیری شناختی و فراشناخت فراهم می‌کند."
      },
      {
        slug: "shenakht-ejtemaei",
        title: "شناخت اجتماعی",
        difficulty_level: :intermediate,
        brief_summary: "شناخت اجتماعی بررسی می‌کند که چگونه اطلاعات مربوط به دیگران را رمزگذاری، ذخیره و بازیابی می‌کنیم.",
        extended_content: "شناخت اجتماعی (Social Cognition) شاخه‌ای از روانشناسی است که نحوه پردازش اطلاعات اجتماعی توسط مغز را مطالعه می‌کند. این حوزه شامل درک نیت‌ها، اسنادها، قالب‌های ذهنی و تأثیر گروه بر قضاوت فردی است. پایه‌های ذهن‌آگاهی برای مشاهده بی‌طرفانه فرآیندهای شناختی اجتماعی ضروری است."
      },
      {
        slug: "sukiri-shenakhti",
        title: "سوگیری شناختی",
        difficulty_level: :intermediate,
        brief_summary: "سوگیری شناختی، الگوی سیستماتیک انحراف از عقلانیت در قضاوت است.",
        extended_content: "سوگیری شناختی (Cognitive Bias) به خطاهای منظم در تفکر اشاره دارد که از میان‌برهای ذهنی (heuristic) ناشی می‌شود. نمونه‌هایی مانند سوگیری تأییدی، اثر لنگر، و سوگیری در دسترس‌بودن نشان می‌دهند که چگونه شناخت اجتماعی ما می‌تواند به سیستماتیک منحرف شود."
      },
      {
        slug: "farashenakht",
        title: "فراشناخت",
        difficulty_level: :advanced,
        brief_summary: "فراشناخت، «تفکر درباره تفکر» و پایش آگاهانه فرآیندهای شناختی خود است.",
        extended_content: "فراشناخت (Metacognition) توانایی بازاندیشی و تنظیم فرآیندهای شناختی است. با ترکیب ذهن‌آگاهی (برای مشاهده)، شناخت اجتماعی (برای زمینه) و آگاهی از سوگیری‌های شناختی، فراشناخت به فرد امکان می‌دهد تصمیم‌گیری خود را با دقت بیشتری ارزیابی و اصلاح کند."
      }
    ]
  },
  {
    slug: "sociology",
    name: "جامعه‌شناسی",
    description: "مطالعه نظام‌مند جامعه، روابط انسانی و نهادهای اجتماعی.",
    position: 1,
    color: "sky-500",
    icon: "users",
    category_slug: "social-sciences",
    concepts: [
      {
        slug: "farhang",
        title: "فرهنگ",
        difficulty_level: :beginner,
        brief_summary: "فرهنگ، مجموعه‌ای از باورها، ارزش‌ها، آداب و نمادهای مشترک میان اعضای یک جامعه است.",
        extended_content: "فرهنگ (Culture) در جامعه‌شناسی به شیوه‌های زیستن، اندیشیدن و معنا ساختن اطلاق می‌شود که از نسلی به نسل دیگر منتقل می‌شود. فرهنگ دربرگیرنده زبان، دین، هنر، فناوری و قواعد نانوشته رفتاری است و زمینه‌ای را فراهم می‌کند که در آن هنجارها، ساختارها و تغییرات اجتماعی شکل می‌گیرند. درک فرهنگ، گام نخست برای تحلیل هر پدیده اجتماعی است."
      },
      {
        slug: "hanjar-ejtemaei",
        title: "هنجارهای اجتماعی",
        difficulty_level: :intermediate,
        brief_summary: "هنجارهای اجتماعی، قواعد نانوشته‌ای هستند که رفتار قابل‌قبول را در یک گروه تعیین می‌کنند.",
        extended_content: "هنجارهای اجتماعی (Social Norms) انتظارات مشترکی هستند که اعضای یک جامعه را به رفتار هم‌سو وامی‌دارند. هنجارها ریشه در فرهنگ دارند و از طریق جامعه‌پذیری، تشویق و تنبیه درونی می‌شوند. تخطی از آن‌ها معمولاً با واکنش‌های اجتماعی همراه است و مطالعه آن‌ها کلید فهم نظم و کنترل اجتماعی است."
      },
      {
        slug: "sakhtar-ejtemaei",
        title: "ساختار اجتماعی",
        difficulty_level: :intermediate,
        brief_summary: "ساختار اجتماعی، الگوی پایدار روابط، نقش‌ها و نهادهایی است که چارچوب کنش اجتماعی را می‌سازد.",
        extended_content: "ساختار اجتماعی (Social Structure) به شبکه پایداری از نقش‌ها، موقعیت‌ها و نهادها اشاره دارد که رفتار افراد را محدود یا تسهیل می‌کند. طبقه اجتماعی، خانواده، آموزش و اقتصاد نمونه‌هایی از ساختارها هستند. هنجارهای اجتماعی در بستر این ساختارها معنا می‌یابند و بازتولید می‌شوند."
      },
      {
        slug: "taghir-ejtemaei",
        title: "تغییر اجتماعی",
        difficulty_level: :advanced,
        brief_summary: "تغییر اجتماعی، دگرگونی در الگوهای فرهنگی، هنجاری و ساختاری یک جامعه در طول زمان است.",
        extended_content: "تغییر اجتماعی (Social Change) فرآیندی است که در اثر عوامل درونی (جنبش‌ها، نوآوری) و بیرونی (فناوری، تماس فرهنگی، بحران‌ها) رخ می‌دهد. فهم این پدیده نیازمند درک توأمان فرهنگ، هنجارها و ساختار اجتماعی است، زیرا تغییر در هر لایه می‌تواند لایه‌های دیگر را متحول کند."
      }
    ]
  },
  {
    slug: "political-science",
    name: "علوم سیاسی",
    description: "مطالعه قدرت، حکومت، نهادهای سیاسی و رفتار سیاسی.",
    position: 2,
    color: "rose-500",
    icon: "landmark",
    category_slug: "social-sciences",
    concepts: [
      {
        slug: "ghodrat",
        title: "قدرت",
        difficulty_level: :beginner,
        brief_summary: "قدرت، توانایی تأثیرگذاری بر رفتار دیگران یا جهت‌دهی به تصمیمات جمعی است.",
        extended_content: "قدرت (Power) مفهوم بنیادی در علوم سیاسی است و می‌تواند به شکل زور، اقتدار مشروع، ثروت یا نفوذ نمادین ظاهر شود. اندیشمندانی مانند ماکس وبر و میشل فوکو آن را از زوایای گوناگون بررسی کرده‌اند. درک انواع قدرت، پیش‌نیاز تحلیل حکومت و نظام‌های سیاسی است."
      },
      {
        slug: "hokoomat",
        title: "حکومت",
        difficulty_level: :intermediate,
        brief_summary: "حکومت، نهادی است که قدرت سیاسی را سازمان می‌دهد و قواعد الزام‌آور برای جامعه وضع می‌کند.",
        extended_content: "حکومت (Government) مجموعه‌ای از نهادها، فرآیندها و افراد است که اختیار تصمیم‌گیری جمعی را در یک قلمرو اعمال می‌کند. اشکال آن از سلطنت مطلقه تا جمهوری فدرال متنوع است. حکومت، قدرت خام را به اقتدار ساختارمند تبدیل می‌کند و بستر لازم برای شکل‌گیری نظم سیاسی را فراهم می‌سازد."
      },
      {
        slug: "democracy",
        title: "دموکراسی",
        difficulty_level: :intermediate,
        brief_summary: "دموکراسی، نظام سیاسی‌ای است که در آن قدرت از طریق مشارکت مردم اعمال می‌شود.",
        extended_content: "دموکراسی (Democracy) بر اصولی مانند حاکمیت مردم، انتخابات آزاد، حقوق شهروندی و جدایی قوا استوار است. این شکل از حکومت، نحوه توزیع و مهار قدرت را متحول می‌کند و فضایی برای رقابت مسالمت‌آمیز بر سر سیاست‌ها می‌گشاید. درک دموکراسی بدون فهم قدرت و حکومت ناقص است."
      },
      {
        slug: "ideology-siyasi",
        title: "ایدئولوژی سیاسی",
        difficulty_level: :advanced,
        brief_summary: "ایدئولوژی سیاسی، نظامی از ایده‌ها و ارزش‌هاست که درباره سامان مطلوب جامعه راهنمایی می‌دهد.",
        extended_content: "ایدئولوژی سیاسی (Political Ideology) چارچوب‌هایی مانند لیبرالیسم، سوسیالیسم، محافظه‌کاری و ناسیونالیسم را شامل می‌شود که هرکدام تفسیر متفاوتی از قدرت، نقش حکومت و معنای دموکراسی ارائه می‌دهند. ایدئولوژی‌ها، رفتار رأی‌دهندگان، برنامه احزاب و سیاست‌گذاری را جهت می‌دهند."
      }
    ]
  },
  {
    slug: "economics",
    name: "اقتصاد",
    description: "مطالعه تولید، توزیع و مصرف کالاها و خدمات و رفتار عاملان اقتصادی.",
    position: 3,
    color: "emerald-500",
    icon: "trending-up",
    category_slug: "social-sciences",
    concepts: [
      {
        slug: "arze-taghaza",
        title: "عرضه و تقاضا",
        difficulty_level: :beginner,
        brief_summary: "عرضه و تقاضا، نیروی بنیادی تعیین قیمت و مقدار کالاها در بازار است.",
        extended_content: "عرضه و تقاضا (Supply and Demand) هسته اصلی اقتصاد خرد است. عرضه، مقدار کالایی است که تولیدکنندگان حاضر به فروش آن در قیمت‌های مختلف‌اند و تقاضا، مقداری است که مصرف‌کنندگان حاضر به خرید آن‌اند. نقطه تعادل این دو، قیمت بازاری را تعیین می‌کند و پایه فهم عملکرد بازارها است."
      },
      {
        slug: "bazar",
        title: "بازار",
        difficulty_level: :intermediate,
        brief_summary: "بازار، سازوکاری است که در آن خریداران و فروشندگان برای مبادله کالا و خدمت گرد هم می‌آیند.",
        extended_content: "بازار (Market) می‌تواند فیزیکی یا مجازی، رقابتی یا انحصاری باشد. کارکرد بازار به تعامل عرضه و تقاضا وابسته است و نقش کلیدی در تخصیص منابع ایفا می‌کند. شکست‌های بازار، اطلاعات نامتقارن و اثرات بیرونی از موضوعات مهمی‌اند که ساختار بازار را پیچیده می‌کنند."
      },
      {
        slug: "tavarom",
        title: "تورم",
        difficulty_level: :intermediate,
        brief_summary: "تورم، افزایش پایدار در سطح عمومی قیمت‌ها و کاهش قدرت خرید پول است.",
        extended_content: "تورم (Inflation) در اثر عواملی مانند رشد نقدینگی، افزایش هزینه تولید یا انتظارات تورمی رخ می‌دهد. تورم بر رفتار بازار، تصمیمات پس‌انداز و سرمایه‌گذاری اثر می‌گذارد و سیاست پولی بانک مرکزی معمولاً برای مهار آن طراحی می‌شود. درک تورم برای تحلیل رشد اقتصادی ضروری است."
      },
      {
        slug: "roshd-eghtesadi",
        title: "رشد اقتصادی",
        difficulty_level: :advanced,
        brief_summary: "رشد اقتصادی، افزایش پایدار در تولید ناخالص داخلی یک کشور در طول زمان است.",
        extended_content: "رشد اقتصادی (Economic Growth) ناشی از افزایش سرمایه فیزیکی، سرمایه انسانی، فناوری و بهره‌وری است. رشد به‌تنهایی تضمین‌کننده رفاه نیست و باید در کنار شاخص‌هایی مانند توزیع درآمد و پایداری محیطی سنجیده شود. تورم مهارنشده و شکست بازارها از موانع رشد بلندمدت‌اند."
      }
    ]
  },
  {
    slug: "anthropology",
    name: "مردم‌شناسی",
    description: "مطالعه انسان، فرهنگ‌های او و تنوع شیوه‌های زیستن در گستره زمان و مکان.",
    position: 4,
    color: "amber-500",
    icon: "globe",
    category_slug: "social-sciences",
    concepts: [
      {
        slug: "farhang-paziri",
        title: "فرهنگ‌پذیری",
        difficulty_level: :beginner,
        brief_summary: "فرهنگ‌پذیری، فرآیندی است که فرد از طریق آن فرهنگ جامعه خود را درونی می‌کند.",
        extended_content: "فرهنگ‌پذیری (Enculturation) از دوران کودکی آغاز می‌شود و از طریق خانواده، آموزش و رسانه ادامه می‌یابد. این فرآیند تعیین می‌کند که فرد چگونه بیندیشد، احساس کند و رفتار نماید و پیش‌شرط فهم روش‌های مطالعه فرهنگ در مردم‌شناسی است."
      },
      {
        slug: "ghoum-negari",
        title: "قوم‌نگاری",
        difficulty_level: :intermediate,
        brief_summary: "قوم‌نگاری، روشی کیفی برای توصیف و تحلیل عمیق یک فرهنگ از درون است.",
        extended_content: "قوم‌نگاری (Ethnography) با مشاهده مشارکتی، مصاحبه و زیست طولانی‌مدت در میان یک جامعه انجام می‌شود. پژوهشگر می‌کوشد معنا را از دیدگاه کنشگران بفهمد، نه از بیرون. این روش نیازمند حساسیت به فرآیند فرهنگ‌پذیری و پرهیز از پیش‌داوری‌های خودمرکزبینانه است."
      },
      {
        slug: "khishavandi",
        title: "خویشاوندی",
        difficulty_level: :intermediate,
        brief_summary: "خویشاوندی، نظامی از روابط مبتنی بر خون، ازدواج یا فرزندخواندگی است که جامعه را سازمان می‌دهد.",
        extended_content: "خویشاوندی (Kinship) یکی از کهن‌ترین موضوعات مردم‌شناسی است و در هر فرهنگ شکل متفاوتی دارد. مطالعه اصطلاحات خویشاوندی، الگوهای ازدواج و وراثت از طریق قوم‌نگاری صورت می‌گیرد و نشان می‌دهد چگونه جوامع، روابط فامیلی را معنا و سامان می‌بخشند."
      },
      {
        slug: "nesbi-garaei-farhangi",
        title: "نسبی‌گرایی فرهنگی",
        difficulty_level: :advanced,
        brief_summary: "نسبی‌گرایی فرهنگی، دیدگاهی است که هر فرهنگ را باید در بستر خودش فهمید و داوری کرد.",
        extended_content: "نسبی‌گرایی فرهنگی (Cultural Relativism) در برابر قوم‌مداری می‌ایستد و می‌گوید معیارهای یک فرهنگ را نمی‌توان بی‌چون‌وچرا بر فرهنگی دیگر تحمیل کرد. این رویکرد، میراث قوم‌نگاری و مطالعه خویشاوندی است و پرسش‌های اخلاقی مهمی درباره حقوق جهانی بشر پیش می‌کشد."
      }
    ]
  },

  # ---------- Humanities (placeholders) ----------
  {
    slug: "philosophy",
    name: "فلسفه",
    description: "کاوش بنیادی درباره هستی، دانش، ارزش و خرد.",
    position: 0,
    color: "indigo-500",
    icon: "lightbulb",
    category_slug: "humanities",
    concepts: []
  },
  {
    slug: "history",
    name: "تاریخ",
    description: "روایت و تحلیل گذشته انسان و تحولات جوامع در طول زمان.",
    position: 1,
    color: "orange-500",
    icon: "scroll",
    category_slug: "humanities",
    concepts: []
  },
  {
    slug: "literature",
    name: "ادبیات",
    description: "مطالعه متون ادبی، سبک‌ها و سنت‌های خلاقیت زبانی.",
    position: 2,
    color: "pink-500",
    icon: "book-open",
    category_slug: "humanities",
    concepts: []
  },
  {
    slug: "linguistics",
    name: "زبان‌شناسی",
    description: "بررسی علمی ساختار، کاربرد و تحول زبان‌های انسانی.",
    position: 3,
    color: "cyan-500",
    icon: "languages",
    category_slug: "humanities",
    concepts: []
  },
  {
    slug: "law",
    name: "حقوق",
    description: "مطالعه قواعد، نهادها و نظریه‌های حاکم بر روابط حقوقی.",
    position: 4,
    color: "yellow-500",
    icon: "scale",
    category_slug: "humanities",
    concepts: []
  },

  # ---------- Interdisciplinary (placeholders) ----------
  {
    slug: "cognitive-science",
    name: "علوم شناختی",
    description: "مطالعه میان‌رشته‌ای ذهن، هوش و فرآیندهای شناختی.",
    position: 0,
    color: "fuchsia-500",
    icon: "cpu",
    category_slug: "interdisciplinary",
    concepts: []
  },
  {
    slug: "management",
    name: "مدیریت",
    description: "نظریه و عمل سازمان‌دهی منابع، افراد و تصمیم‌ها برای دستیابی به اهداف.",
    position: 1,
    color: "teal-500",
    icon: "briefcase",
    category_slug: "interdisciplinary",
    concepts: []
  },
  {
    slug: "communications",
    name: "ارتباطات",
    description: "مطالعه فرآیندها و ابزارهای تبادل پیام و معنا در جوامع انسانی.",
    position: 2,
    color: "red-500",
    icon: "megaphone",
    category_slug: "interdisciplinary",
    concepts: []
  }
]

categories_by_slug = CATEGORIES.to_h do |c_data|
  category = Category.find_or_initialize_by(slug: c_data[:slug])
  category.title    = c_data[:title]
  category.position = c_data[:position]
  category.color    = c_data[:color]
  category.icon     = c_data[:icon]
  category.save!
  [ c_data[:slug], category ]
end

DOMAINS.each do |d_data|
  domain = Domain.find_or_initialize_by(slug: d_data[:slug])
  domain.name        = d_data[:name]
  domain.description = d_data[:description]
  domain.position    = d_data[:position]
  domain.color       = d_data[:color]
  domain.icon        = d_data[:icon]
  domain.category    = categories_by_slug[d_data[:category_slug]]
  domain.save!

  concepts = d_data[:concepts].each_with_index.map do |c_data, idx|
    c = Concept.find_or_initialize_by(slug: c_data[:slug])
    c.domain           = domain
    c.title            = c_data[:title]
    c.difficulty_level = c_data[:difficulty_level]
    c.position         = idx
    c.brief_summary    = c_data[:brief_summary]
    c.extended_content = c_data[:extended_content]
    c.save!
    c
  end

  concepts.each_cons(2) do |prev_concept, next_concept|
    ConceptRelation.find_or_create_by!(
      source_concept: prev_concept,
      target_concept: next_concept
    )
  end
end

# Sample resources on the first Psychology concept.
first_concept = Concept.friendly.find("zehn-agahi")
Resource.find_or_create_by!(
  concept: first_concept,
  title: "قدرت حال",
  author: "اکهارت تُله"
) do |r|
  r.link = "https://example.com/power-of-now"
  r.resource_type = :book
  r.position = 0
end

Resource.find_or_create_by!(
  concept: first_concept,
  title: "مقدمه‌ای بر ذهن‌آگاهی",
  author: "جان کابات-زین"
) do |r|
  r.link = "https://example.com/mindfulness-intro"
  r.resource_type = :article
  r.position = 1
end

puts "Seeded #{Category.count} categor(ies), #{Domain.count} domain(s), #{Concept.count} concept(s), #{ConceptRelation.count} relation(s), #{Resource.count} resource(s)."
