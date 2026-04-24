export type DifficultyLevel = "beginner" | "intermediate" | "advanced" | "expert";
export type ResourceType = "book" | "article" | "video" | "course" | "paper";

export interface Domain {
  id: string;
  slug: string;
  name: string;
  description: string | null;
  position: number;
  color: string | null;
  icon: string | null;
  concepts_count: number;
}

export interface Category {
  id: string;
  slug: string;
  title: string;
  position: number;
  color: string | null;
  icon: string | null;
  concepts_count: number;
  domains: Domain[];
}

export interface ConceptSummary {
  id: string;
  slug: string;
  title: string;
  brief_summary: string | null;
  difficulty_level: DifficultyLevel;
  position: number;
}

export interface Resource {
  id: string;
  title: string;
  author: string | null;
  link: string;
  resource_type: ResourceType;
  position: number;
}

export interface Concept extends ConceptSummary {
  extended_content: string | null;
  views_count: number;
  prerequisites: ConceptSummary[];
  next_steps: ConceptSummary[];
  resources: Resource[];
}

export const DIFFICULTY_LABELS_FA: Record<DifficultyLevel, string> = {
  beginner: "مقدماتی",
  intermediate: "متوسط",
  advanced: "پیشرفته",
  expert: "حرفه‌ای",
};

export interface ConceptSearchHit {
  id: string;
  slug: string;
  title: string;
  domain_slug: string;
  domain_name: string;
}

export const RESOURCE_TYPE_LABELS_FA: Record<ResourceType, string> = {
  book: "کتاب",
  article: "مقاله",
  video: "ویدیو",
  course: "دوره",
  paper: "پژوهش",
};
