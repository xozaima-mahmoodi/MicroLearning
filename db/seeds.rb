# Seed idempotently with find_or_create_by! so re-running is safe.

psychology = Domain.find_or_create_by!(slug: "psychology") do |d|
  d.name = "روانشناسی"
  d.description = "مطالعه ذهن، رفتار و فرآیندهای شناختی انسان."
  d.position = 0
end

concepts_data = [
  {
    slug: "zehn-agahi",
    title: "ذهن‌آگاهی",
    difficulty_level: :beginner,
    position: 0,
    brief_summary: "ذهن‌آگاهی، آگاهی لحظه‌به‌لحظه و بدون قضاوت از تجربه درونی و بیرونی است.",
    extended_content: "ذهن‌آگاهی (Mindfulness) تمرینی است که ریشه در سنت‌های مراقبه دارد و در روانشناسی مدرن برای کاهش استرس و افزایش بهزیستی به کار می‌رود. اصل بنیادین آن، آوردن توجه به زمان حال و پذیرش تجربه بدون واکنش خودکار است. این مفهوم شالوده‌ای برای درک شناخت اجتماعی، سوگیری شناختی و فراشناخت فراهم می‌کند."
  },
  {
    slug: "shenakht-ejtemaei",
    title: "شناخت اجتماعی",
    difficulty_level: :intermediate,
    position: 1,
    brief_summary: "شناخت اجتماعی بررسی می‌کند که چگونه اطلاعات مربوط به دیگران را رمزگذاری، ذخیره و بازیابی می‌کنیم.",
    extended_content: "شناخت اجتماعی (Social Cognition) شاخه‌ای از روانشناسی است که نحوه پردازش اطلاعات اجتماعی توسط مغز را مطالعه می‌کند. این حوزه شامل درک نیت‌ها، اسنادها، قالب‌های ذهنی و تأثیر گروه بر قضاوت فردی است. پایه‌های ذهن‌آگاهی برای مشاهده بی‌طرفانه فرآیندهای شناختی اجتماعی ضروری است."
  },
  {
    slug: "sukiri-shenakhti",
    title: "سوگیری شناختی",
    difficulty_level: :intermediate,
    position: 2,
    brief_summary: "سوگیری شناختی، الگوی سیستماتیک انحراف از عقلانیت در قضاوت است.",
    extended_content: "سوگیری شناختی (Cognitive Bias) به خطاهای منظم در تفکر اشاره دارد که از میان‌برهای ذهنی (heuristic) ناشی می‌شود. نمونه‌هایی مانند سوگیری تأییدی، اثر لنگر، و سوگیری در دسترس‌بودن نشان می‌دهند که چگونه شناخت اجتماعی ما می‌تواند به سیستماتیک منحرف شود."
  },
  {
    slug: "farashenakht",
    title: "فراشناخت",
    difficulty_level: :advanced,
    position: 3,
    brief_summary: "فراشناخت، «تفکر درباره تفکر» و پایش آگاهانه فرآیندهای شناختی خود است.",
    extended_content: "فراشناخت (Metacognition) توانایی بازاندیشی و تنظیم فرآیندهای شناختی است. با ترکیب ذهن‌آگاهی (برای مشاهده)، شناخت اجتماعی (برای زمینه) و آگاهی از سوگیری‌های شناختی، فراشناخت به فرد امکان می‌دهد تصمیم‌گیری خود را با دقت بیشتری ارزیابی و اصلاح کند."
  }
]

concepts = concepts_data.map do |data|
  c = Concept.find_or_initialize_by(slug: data[:slug])
  c.domain = psychology
  c.title = data[:title]
  c.difficulty_level = data[:difficulty_level]
  c.position = data[:position]
  c.brief_summary = data[:brief_summary]
  c.extended_content = data[:extended_content]
  c.save!
  c
end

# Build prerequisite chain: each concept prerequisite of the next.
concepts.each_cons(2) do |prev_concept, next_concept|
  ConceptRelation.find_or_create_by!(
    source_concept: prev_concept,
    target_concept: next_concept
  )
end

# Sample resources on the first concept.
first_concept = concepts.first
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

puts "Seeded #{Domain.count} domain(s), #{Concept.count} concept(s), #{ConceptRelation.count} relation(s), #{Resource.count} resource(s)."
