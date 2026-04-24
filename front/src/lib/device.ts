// A stable, anonymous identifier per browser. Used by the activity API to
// scope per-device history without an auth system. Generated lazily and
// persisted in localStorage so the same device keeps the same id across
// reloads.
const KEY = "ml.device.v1";

function generate(): string {
  // crypto.randomUUID is available in all browsers we target; the fallback
  // is for very old or non-secure contexts.
  if (typeof crypto !== "undefined" && "randomUUID" in crypto) {
    return crypto.randomUUID();
  }
  return `dev-${Date.now().toString(36)}-${Math.random().toString(36).slice(2, 10)}`;
}

export function getDeviceId(): string {
  try {
    const existing = localStorage.getItem(KEY);
    if (existing) return existing;
    const fresh = generate();
    localStorage.setItem(KEY, fresh);
    return fresh;
  } catch {
    // Privacy mode / quota — fall back to an in-memory id for the session.
    return generate();
  }
}
