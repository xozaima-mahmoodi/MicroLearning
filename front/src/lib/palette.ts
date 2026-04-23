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
};

// Tailwind class strings must appear literally in source so the JIT
// scanner picks them up. Each entry below is intentionally a static
// string set — do not concatenate dynamically.
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
  "violet-500":  { iconText: "text-violet-600",  iconBg: "bg-violet-50",  iconBgSolid: "bg-violet-500",  border: "border-t-violet-500",  ring: "ring-violet-100",  glow: "shadow-violet-200/50",  accentText: "text-violet-700",  groupHoverAccent: "group-hover:text-violet-700",   gradient: "bg-gradient-to-br from-violet-500 to-fuchsia-600",  gradientGlow: "shadow-violet-500/50"  },
  "sky-500":     { iconText: "text-sky-600",     iconBg: "bg-sky-50",     iconBgSolid: "bg-sky-500",     border: "border-t-sky-500",     ring: "ring-sky-100",     glow: "shadow-sky-200/50",     accentText: "text-sky-700",     groupHoverAccent: "group-hover:text-sky-700",      gradient: "bg-gradient-to-br from-sky-500 to-blue-600",        gradientGlow: "shadow-sky-500/50"     },
  "rose-500":    { iconText: "text-rose-600",    iconBg: "bg-rose-50",    iconBgSolid: "bg-rose-500",    border: "border-t-rose-500",    ring: "ring-rose-100",    glow: "shadow-rose-200/50",    accentText: "text-rose-700",    groupHoverAccent: "group-hover:text-rose-700",     gradient: "bg-gradient-to-br from-rose-500 to-pink-600",       gradientGlow: "shadow-rose-500/50"    },
  "emerald-500": { iconText: "text-emerald-600", iconBg: "bg-emerald-50", iconBgSolid: "bg-emerald-500", border: "border-t-emerald-500", ring: "ring-emerald-100", glow: "shadow-emerald-200/50", accentText: "text-emerald-700", groupHoverAccent: "group-hover:text-emerald-700",  gradient: "bg-gradient-to-br from-emerald-500 to-teal-600",    gradientGlow: "shadow-emerald-500/50" },
  "amber-500":   { iconText: "text-amber-600",   iconBg: "bg-amber-50",   iconBgSolid: "bg-amber-500",   border: "border-t-amber-500",   ring: "ring-amber-100",   glow: "shadow-amber-200/50",   accentText: "text-amber-700",   groupHoverAccent: "group-hover:text-amber-700",    gradient: "bg-gradient-to-br from-amber-500 to-orange-600",    gradientGlow: "shadow-amber-500/50"   },
  "indigo-500":  { iconText: "text-indigo-600",  iconBg: "bg-indigo-50",  iconBgSolid: "bg-indigo-500",  border: "border-t-indigo-500",  ring: "ring-indigo-100",  glow: "shadow-indigo-200/50",  accentText: "text-indigo-700",  groupHoverAccent: "group-hover:text-indigo-700",   gradient: "bg-gradient-to-br from-indigo-500 to-violet-600",   gradientGlow: "shadow-indigo-500/50"  },
  "orange-500":  { iconText: "text-orange-600",  iconBg: "bg-orange-50",  iconBgSolid: "bg-orange-500",  border: "border-t-orange-500",  ring: "ring-orange-100",  glow: "shadow-orange-200/50",  accentText: "text-orange-700",  groupHoverAccent: "group-hover:text-orange-700",   gradient: "bg-gradient-to-br from-orange-500 to-red-600",      gradientGlow: "shadow-orange-500/50"  },
  "pink-500":    { iconText: "text-pink-600",    iconBg: "bg-pink-50",    iconBgSolid: "bg-pink-500",    border: "border-t-pink-500",    ring: "ring-pink-100",    glow: "shadow-pink-200/50",    accentText: "text-pink-700",    groupHoverAccent: "group-hover:text-pink-700",     gradient: "bg-gradient-to-br from-pink-500 to-rose-600",       gradientGlow: "shadow-pink-500/50"    },
  "cyan-500":    { iconText: "text-cyan-600",    iconBg: "bg-cyan-50",    iconBgSolid: "bg-cyan-500",    border: "border-t-cyan-500",    ring: "ring-cyan-100",    glow: "shadow-cyan-200/50",    accentText: "text-cyan-700",    groupHoverAccent: "group-hover:text-cyan-700",     gradient: "bg-gradient-to-br from-cyan-500 to-sky-600",        gradientGlow: "shadow-cyan-500/50"    },
  "yellow-500":  { iconText: "text-yellow-600",  iconBg: "bg-yellow-50",  iconBgSolid: "bg-yellow-500",  border: "border-t-yellow-500",  ring: "ring-yellow-100",  glow: "shadow-yellow-200/50",  accentText: "text-yellow-700",  groupHoverAccent: "group-hover:text-yellow-700",   gradient: "bg-gradient-to-br from-yellow-500 to-amber-600",    gradientGlow: "shadow-yellow-500/50"  },
  "fuchsia-500": { iconText: "text-fuchsia-600", iconBg: "bg-fuchsia-50", iconBgSolid: "bg-fuchsia-500", border: "border-t-fuchsia-500", ring: "ring-fuchsia-100", glow: "shadow-fuchsia-200/50", accentText: "text-fuchsia-700", groupHoverAccent: "group-hover:text-fuchsia-700",  gradient: "bg-gradient-to-br from-fuchsia-500 to-pink-600",    gradientGlow: "shadow-fuchsia-500/50" },
  "teal-500":    { iconText: "text-teal-600",    iconBg: "bg-teal-50",    iconBgSolid: "bg-teal-500",    border: "border-t-teal-500",    ring: "ring-teal-100",    glow: "shadow-teal-200/50",    accentText: "text-teal-700",    groupHoverAccent: "group-hover:text-teal-700",     gradient: "bg-gradient-to-br from-teal-500 to-cyan-600",       gradientGlow: "shadow-teal-500/50"    },
  "red-500":     { iconText: "text-red-600",     iconBg: "bg-red-50",     iconBgSolid: "bg-red-500",     border: "border-t-red-500",     ring: "ring-red-100",     glow: "shadow-red-200/50",     accentText: "text-red-700",     groupHoverAccent: "group-hover:text-red-700",      gradient: "bg-gradient-to-br from-red-500 to-rose-600",        gradientGlow: "shadow-red-500/50"     },
  "blue-500":    { iconText: "text-blue-600",    iconBg: "bg-blue-50",    iconBgSolid: "bg-blue-500",    border: "border-t-blue-500",    ring: "ring-blue-100",    glow: "shadow-blue-200/50",    accentText: "text-blue-700",    groupHoverAccent: "group-hover:text-blue-700",     gradient: "bg-gradient-to-br from-blue-500 to-indigo-600",     gradientGlow: "shadow-blue-500/50"    },
  "purple-500":  { iconText: "text-purple-600",  iconBg: "bg-purple-50",  iconBgSolid: "bg-purple-500",  border: "border-t-purple-500",  ring: "ring-purple-100",  glow: "shadow-purple-200/50",  accentText: "text-purple-700",  groupHoverAccent: "group-hover:text-purple-700",   gradient: "bg-gradient-to-br from-purple-500 to-pink-600",     gradientGlow: "shadow-purple-500/50"  },
  "lime-500":    { iconText: "text-lime-600",    iconBg: "bg-lime-50",    iconBgSolid: "bg-lime-500",    border: "border-t-lime-500",    ring: "ring-lime-100",    glow: "shadow-lime-200/50",    accentText: "text-lime-700",    groupHoverAccent: "group-hover:text-lime-700",     gradient: "bg-gradient-to-br from-lime-500 to-emerald-600",    gradientGlow: "shadow-lime-500/50"    },
};

export const FALLBACK_PALETTE: Palette = {
  iconText:         "text-slate-600",
  iconBg:           "bg-slate-100",
  iconBgSolid:      "bg-slate-500",
  border:           "border-t-slate-400",
  ring:             "ring-slate-100",
  glow:             "shadow-slate-200/50",
  accentText:       "text-slate-700",
  groupHoverAccent: "group-hover:text-slate-700",
  gradient:         "bg-gradient-to-br from-slate-500 to-slate-700",
  gradientGlow:     "shadow-slate-500/40",
};

export function paletteFor(color: string | null | undefined): Palette {
  return (color && COLOR_MAP[color]) || FALLBACK_PALETTE;
}

export function iconFor(name: string | null | undefined): LucideIcon {
  return (name && ICON_MAP[name]) || BookOpen;
}
