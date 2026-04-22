export type DifficultyLevel = "beginner" | "intermediate" | "advanced" | "expert";
export type ResourceType = "book" | "article" | "video" | "course" | "paper";

export interface Domain {
  id: string;
  slug: string;
  name: string;
  description: string | null;
  position: number;
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

export const RESOURCE_TYPE_LABELS_FA: Record<ResourceType, string> = {
  book: "کتاب",
  article: "مقاله",
  video: "ویدیو",
  course: "دوره",
  paper: "پژوهش",
};
