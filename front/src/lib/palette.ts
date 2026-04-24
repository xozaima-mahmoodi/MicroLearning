import {
  Brain,
  Users,
  Landmark,
  TrendingUp,
  Globe,
  BookOpen,
  Lightbulb,
  Scroll,
  Languages,
  Scale,
  Cpu,
  Briefcase,
  Megaphone,
  Layers,
  Feather,
  Network,
  Library,
  Book,
  Mic,
  History,
  Sparkles,
  Quote,
  type LucideIcon,
} from "lucide-vue-next";

export const ICON_MAP: Record<string, LucideIcon> = {
  brain: Brain,
  users: Users,
  landmark: Landmark,
  "trending-up": TrendingUp,
  globe: Globe,
  lightbulb: Lightbulb,
  scroll: Scroll,
  "book-open": BookOpen,
  languages: Languages,
  scale: Scale,
  cpu: Cpu,
  briefcase: Briefcase,
  megaphone: Megaphone,
  layers: Layers,
  feather: Feather,
  network: Network,
  library: Library,
  book: Book,
  mic: Mic,
  history: History,
  sparkles: Sparkles,
  quote: Quote,
};

// Tailwind class strings must appear literally in source so the JIT
// scanner picks them up. Each entry below is intentionally a static
// string set — do not concatenate dynamically. Dark variants live
// alongside their light twins on the same line for the same reason.
export type Palette = {
  iconText: string;
  iconBg: string;
  iconBgSolid: string;
  border: string;
  ring: string;
  glow: string;
  accentText: string;
  groupHoverAccent: string;
  // Vibrant gradient used for category cards. Paired to a neighbouring hue
  // so the card reads as a single "theme" rather than a flat color.
  gradient: string;
  // Colored drop-shadow for active/expanded state — static literal so the JIT picks it up.
  gradientGlow: string;
};

export const COLOR_MAP: Record<string, Palette> = {
  "violet-500":  { iconText: "text-violet-600 dark:text-violet-300",   iconBg: "bg-violet-50 dark:bg-violet-400/15",   iconBgSolid: "bg-violet-500",  border: "border-t-violet-500",  ring: "ring-violet-100 dark:ring-violet-400/20",   glow: "shadow-violet-200/50 dark:shadow-violet-500/20",   accentText: "text-violet-700 dark:text-violet-300",   groupHoverAccent: "group-hover:text-violet-700 dark:group-hover:text-violet-300",    gradient: "bg-gradient-to-br from-violet-500 to-fuchsia-600 dark:from-violet-600 dark:to-fuchsia-700",    gradientGlow: "shadow-violet-500/50 dark:shadow-violet-600/40"  },
  "sky-500":     { iconText: "text-sky-600 dark:text-sky-300",         iconBg: "bg-sky-50 dark:bg-sky-400/15",         iconBgSolid: "bg-sky-500",     border: "border-t-sky-500",     ring: "ring-sky-100 dark:ring-sky-400/20",         glow: "shadow-sky-200/50 dark:shadow-sky-500/20",         accentText: "text-sky-700 dark:text-sky-300",         groupHoverAccent: "group-hover:text-sky-700 dark:group-hover:text-sky-300",          gradient: "bg-gradient-to-br from-sky-500 to-blue-600 dark:from-sky-600 dark:to-blue-700",                gradientGlow: "shadow-sky-500/50 dark:shadow-sky-600/40"        },
  "rose-500":    { iconText: "text-rose-600 dark:text-rose-300",       iconBg: "bg-rose-50 dark:bg-rose-400/15",       iconBgSolid: "bg-rose-500",    border: "border-t-rose-500",    ring: "ring-rose-100 dark:ring-rose-400/20",       glow: "shadow-rose-200/50 dark:shadow-rose-500/20",       accentText: "text-rose-700 dark:text-rose-300",       groupHoverAccent: "group-hover:text-rose-700 dark:group-hover:text-rose-300",        gradient: "bg-gradient-to-br from-rose-500 to-pink-600 dark:from-rose-600 dark:to-pink-700",              gradientGlow: "shadow-rose-500/50 dark:shadow-rose-600/40"      },
  "emerald-500": { iconText: "text-emerald-600 dark:text-emerald-300", iconBg: "bg-emerald-50 dark:bg-emerald-400/15", iconBgSolid: "bg-emerald-500", border: "border-t-emerald-500", ring: "ring-emerald-100 dark:ring-emerald-400/20", glow: "shadow-emerald-200/50 dark:shadow-emerald-500/20", accentText: "text-emerald-700 dark:text-emerald-300", groupHoverAccent: "group-hover:text-emerald-700 dark:group-hover:text-emerald-300",  gradient: "bg-gradient-to-br from-emerald-500 to-teal-600 dark:from-emerald-600 dark:to-teal-700",        gradientGlow: "shadow-emerald-500/50 dark:shadow-emerald-600/40" },
  "amber-500":   { iconText: "text-amber-600 dark:text-amber-300",     iconBg: "bg-amber-50 dark:bg-amber-400/15",     iconBgSolid: "bg-amber-500",   border: "border-t-amber-500",   ring: "ring-amber-100 dark:ring-amber-400/20",     glow: "shadow-amber-200/50 dark:shadow-amber-500/20",     accentText: "text-amber-700 dark:text-amber-300",     groupHoverAccent: "group-hover:text-amber-700 dark:group-hover:text-amber-300",      gradient: "bg-gradient-to-br from-amber-500 to-orange-600 dark:from-amber-600 dark:to-orange-700",        gradientGlow: "shadow-amber-500/50 dark:shadow-amber-600/40"    },
  "indigo-500":  { iconText: "text-indigo-600 dark:text-indigo-300",   iconBg: "bg-indigo-50 dark:bg-indigo-400/15",   iconBgSolid: "bg-indigo-500",  border: "border-t-indigo-500",  ring: "ring-indigo-100 dark:ring-indigo-400/20",   glow: "shadow-indigo-200/50 dark:shadow-indigo-500/20",   accentText: "text-indigo-700 dark:text-indigo-300",   groupHoverAccent: "group-hover:text-indigo-700 dark:group-hover:text-indigo-300",    gradient: "bg-gradient-to-br from-indigo-500 to-violet-600 dark:from-indigo-600 dark:to-violet-700",      gradientGlow: "shadow-indigo-500/50 dark:shadow-indigo-600/40"  },
  "orange-500":  { iconText: "text-orange-600 dark:text-orange-300",   iconBg: "bg-orange-50 dark:bg-orange-400/15",   iconBgSolid: "bg-orange-500",  border: "border-t-orange-500",  ring: "ring-orange-100 dark:ring-orange-400/20",   glow: "shadow-orange-200/50 dark:shadow-orange-500/20",   accentText: "text-orange-700 dark:text-orange-300",   groupHoverAccent: "group-hover:text-orange-700 dark:group-hover:text-orange-300",    gradient: "bg-gradient-to-br from-orange-500 to-red-600 dark:from-orange-600 dark:to-red-700",            gradientGlow: "shadow-orange-500/50 dark:shadow-orange-600/40"  },
  "pink-500":    { iconText: "text-pink-600 dark:text-pink-300",       iconBg: "bg-pink-50 dark:bg-pink-400/15",       iconBgSolid: "bg-pink-500",    border: "border-t-pink-500",    ring: "ring-pink-100 dark:ring-pink-400/20",       glow: "shadow-pink-200/50 dark:shadow-pink-500/20",       accentText: "text-pink-700 dark:text-pink-300",       groupHoverAccent: "group-hover:text-pink-700 dark:group-hover:text-pink-300",        gradient: "bg-gradient-to-br from-pink-500 to-rose-600 dark:from-pink-600 dark:to-rose-700",              gradientGlow: "shadow-pink-500/50 dark:shadow-pink-600/40"      },
  "cyan-500":    { iconText: "text-cyan-600 dark:text-cyan-300",       iconBg: "bg-cyan-50 dark:bg-cyan-400/15",       iconBgSolid: "bg-cyan-500",    border: "border-t-cyan-500",    ring: "ring-cyan-100 dark:ring-cyan-400/20",       glow: "shadow-cyan-200/50 dark:shadow-cyan-500/20",       accentText: "text-cyan-700 dark:text-cyan-300",       groupHoverAccent: "group-hover:text-cyan-700 dark:group-hover:text-cyan-300",        gradient: "bg-gradient-to-br from-cyan-500 to-sky-600 dark:from-cyan-600 dark:to-sky-700",                gradientGlow: "shadow-cyan-500/50 dark:shadow-cyan-600/40"      },
  "yellow-500":  { iconText: "text-yellow-600 dark:text-yellow-300",   iconBg: "bg-yellow-50 dark:bg-yellow-400/15",   iconBgSolid: "bg-yellow-500",  border: "border-t-yellow-500",  ring: "ring-yellow-100 dark:ring-yellow-400/20",   glow: "shadow-yellow-200/50 dark:shadow-yellow-500/20",   accentText: "text-yellow-700 dark:text-yellow-300",   groupHoverAccent: "group-hover:text-yellow-700 dark:group-hover:text-yellow-300",    gradient: "bg-gradient-to-br from-yellow-500 to-amber-600 dark:from-yellow-600 dark:to-amber-700",        gradientGlow: "shadow-yellow-500/50 dark:shadow-yellow-600/40"  },
  "fuchsia-500": { iconText: "text-fuchsia-600 dark:text-fuchsia-300", iconBg: "bg-fuchsia-50 dark:bg-fuchsia-400/15", iconBgSolid: "bg-fuchsia-500", border: "border-t-fuchsia-500", ring: "ring-fuchsia-100 dark:ring-fuchsia-400/20", glow: "shadow-fuchsia-200/50 dark:shadow-fuchsia-500/20", accentText: "text-fuchsia-700 dark:text-fuchsia-300", groupHoverAccent: "group-hover:text-fuchsia-700 dark:group-hover:text-fuchsia-300",  gradient: "bg-gradient-to-br from-fuchsia-500 to-pink-600 dark:from-fuchsia-600 dark:to-pink-700",        gradientGlow: "shadow-fuchsia-500/50 dark:shadow-fuchsia-600/40" },
  "teal-500":    { iconText: "text-teal-600 dark:text-teal-300",       iconBg: "bg-teal-50 dark:bg-teal-400/15",       iconBgSolid: "bg-teal-500",    border: "border-t-teal-500",    ring: "ring-teal-100 dark:ring-teal-400/20",       glow: "shadow-teal-200/50 dark:shadow-teal-500/20",       accentText: "text-teal-700 dark:text-teal-300",       groupHoverAccent: "group-hover:text-teal-700 dark:group-hover:text-teal-300",        gradient: "bg-gradient-to-br from-teal-500 to-cyan-600 dark:from-teal-600 dark:to-cyan-700",              gradientGlow: "shadow-teal-500/50 dark:shadow-teal-600/40"      },
  "red-500":     { iconText: "text-red-600 dark:text-red-300",         iconBg: "bg-red-50 dark:bg-red-400/15",         iconBgSolid: "bg-red-500",     border: "border-t-red-500",     ring: "ring-red-100 dark:ring-red-400/20",         glow: "shadow-red-200/50 dark:shadow-red-500/20",         accentText: "text-red-700 dark:text-red-300",         groupHoverAccent: "group-hover:text-red-700 dark:group-hover:text-red-300",          gradient: "bg-gradient-to-br from-red-500 to-rose-600 dark:from-red-600 dark:to-rose-700",                gradientGlow: "shadow-red-500/50 dark:shadow-red-600/40"        },
  "blue-500":    { iconText: "text-blue-600 dark:text-blue-300",       iconBg: "bg-blue-50 dark:bg-blue-400/15",       iconBgSolid: "bg-blue-500",    border: "border-t-blue-500",    ring: "ring-blue-100 dark:ring-blue-400/20",       glow: "shadow-blue-200/50 dark:shadow-blue-500/20",       accentText: "text-blue-700 dark:text-blue-300",       groupHoverAccent: "group-hover:text-blue-700 dark:group-hover:text-blue-300",        gradient: "bg-gradient-to-br from-blue-500 to-indigo-600 dark:from-blue-600 dark:to-indigo-700",          gradientGlow: "shadow-blue-500/50 dark:shadow-blue-600/40"      },
  "purple-500":  { iconText: "text-purple-600 dark:text-purple-300",   iconBg: "bg-purple-50 dark:bg-purple-400/15",   iconBgSolid: "bg-purple-500",  border: "border-t-purple-500",  ring: "ring-purple-100 dark:ring-purple-400/20",   glow: "shadow-purple-200/50 dark:shadow-purple-500/20",   accentText: "text-purple-700 dark:text-purple-300",   groupHoverAccent: "group-hover:text-purple-700 dark:group-hover:text-purple-300",    gradient: "bg-gradient-to-br from-purple-500 to-pink-600 dark:from-purple-600 dark:to-pink-700",          gradientGlow: "shadow-purple-500/50 dark:shadow-purple-600/40"  },
  "lime-500":    { iconText: "text-lime-600 dark:text-lime-300",       iconBg: "bg-lime-50 dark:bg-lime-400/15",       iconBgSolid: "bg-lime-500",    border: "border-t-lime-500",    ring: "ring-lime-100 dark:ring-lime-400/20",       glow: "shadow-lime-200/50 dark:shadow-lime-500/20",       accentText: "text-lime-700 dark:text-lime-300",       groupHoverAccent: "group-hover:text-lime-700 dark:group-hover:text-lime-300",        gradient: "bg-gradient-to-br from-lime-500 to-emerald-600 dark:from-lime-600 dark:to-emerald-700",        gradientGlow: "shadow-lime-500/50 dark:shadow-lime-600/40"      },
  "emerald-gold":{ iconText: "text-emerald-700 dark:text-amber-300",   iconBg: "bg-emerald-50 dark:bg-emerald-400/15", iconBgSolid: "bg-emerald-600", border: "border-t-emerald-600", ring: "ring-emerald-100 dark:ring-amber-400/20",   glow: "shadow-amber-200/50 dark:shadow-amber-500/20",     accentText: "text-emerald-700 dark:text-amber-300",   groupHoverAccent: "group-hover:text-emerald-700 dark:group-hover:text-amber-300",    gradient: "bg-gradient-to-br from-emerald-600 via-emerald-500 to-amber-600 dark:from-emerald-700 dark:via-emerald-600 dark:to-amber-700", gradientGlow: "shadow-amber-500/50 dark:shadow-amber-600/40"   },
};

export const FALLBACK_PALETTE: Palette = {
  iconText:         "text-slate-600 dark:text-slate-300",
  iconBg:           "bg-slate-100 dark:bg-white/10",
  iconBgSolid:      "bg-slate-500",
  border:           "border-t-slate-400",
  ring:             "ring-slate-100 dark:ring-white/10",
  glow:             "shadow-slate-200/50 dark:shadow-black/30",
  accentText:       "text-slate-700 dark:text-slate-300",
  groupHoverAccent: "group-hover:text-slate-700 dark:group-hover:text-slate-200",
  gradient:         "bg-gradient-to-br from-slate-500 to-slate-700 dark:from-slate-600 dark:to-slate-800",
  gradientGlow:     "shadow-slate-500/40 dark:shadow-slate-700/30",
};

export function paletteFor(color: string | null | undefined): Palette {
  return (color && COLOR_MAP[color]) || FALLBACK_PALETTE;
}

export function iconFor(name: string | null | undefined): LucideIcon {
  return (name && ICON_MAP[name]) || BookOpen;
}
