module PersianSluggable
  extend ActiveSupport::Concern

  PERSIAN_MAP = {
    "ا" => "a", "آ" => "a", "أ" => "a", "إ" => "e",
    "ب" => "b", "پ" => "p", "ت" => "t", "ث" => "s",
    "ج" => "j", "چ" => "ch", "ح" => "h", "خ" => "kh",
    "د" => "d", "ذ" => "z", "ر" => "r", "ز" => "z",
    "ژ" => "zh", "س" => "s", "ش" => "sh", "ص" => "s",
    "ض" => "z", "ط" => "t", "ظ" => "z", "ع" => "a",
    "غ" => "gh", "ف" => "f", "ق" => "gh",
    "ک" => "k", "ك" => "k", "گ" => "g",
    "ل" => "l", "م" => "m", "ن" => "n",
    "و" => "v", "ه" => "h", "ی" => "i", "ي" => "i",
    "ئ" => "i", "ؤ" => "o",
    "ء" => "", "ٔ" => "",
    "‌" => "-", "‍" => "",
    "۰" => "0", "۱" => "1", "۲" => "2", "۳" => "3", "۴" => "4",
    "۵" => "5", "۶" => "6", "۷" => "7", "۸" => "8", "۹" => "9",
    "٠" => "0", "١" => "1", "٢" => "2", "٣" => "3", "٤" => "4",
    "٥" => "5", "٦" => "6", "٧" => "7", "٨" => "8", "٩" => "9"
  }.freeze

  class_methods do
    def transliterate_persian(text)
      return "" if text.blank?
      text.to_s.chars.map { |ch| PERSIAN_MAP.fetch(ch, ch) }.join
    end
  end

  def normalize_friendly_id(text)
    latin = self.class.transliterate_persian(text)
    slug = latin.to_slug.normalize!(transliterations: :latin).to_s
    slug.presence || "item-#{SecureRandom.hex(4)}"
  end
end
