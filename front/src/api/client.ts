import axios from "axios";
import { getDeviceId } from "@/lib/device";
import { LOCALE_STORAGE_KEY, i18n } from "@/i18n";

export const http = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || "http://localhost:3000/api/v1",
  headers: { Accept: "application/vnd.api+json, application/json" },
});

// Reads the active locale at request time so the very first call (before the
// Pinia store mounts) and all subsequent calls send the same X-Locale value.
function currentLocale(): string {
  try {
    const fromStorage = localStorage.getItem(LOCALE_STORAGE_KEY);
    if (fromStorage === "fa" || fromStorage === "en") return fromStorage;
  } catch {
    /* private mode — fall through */
  }
  return (i18n.global.locale.value as string) || "fa";
}

http.interceptors.request.use((config) => {
  config.headers = config.headers ?? {};
  config.headers["X-Device-Id"] = getDeviceId();
  // Backend negotiates locale on every request — sending it explicitly here
  // means the user can flip languages mid-session and the next fetch lands
  // in the new locale without any per-store reset.
  config.headers["X-Locale"] = currentLocale();
  return config;
});

type JsonApiResource<T> = { id: string; type: string; attributes: T };
type JsonApiList<T> = { data: JsonApiResource<T>[] };
type JsonApiSingle<T> = { data: JsonApiResource<T> };

function flatten<T extends object>(resource: JsonApiResource<T>): T & { id: string } {
  return { id: resource.id, ...resource.attributes } as T & { id: string };
}

export async function getList<T extends object>(path: string): Promise<(T & { id: string })[]> {
  const { data } = await http.get<JsonApiList<T>>(path);
  return data.data.map(flatten);
}

export async function getOne<T extends object>(path: string): Promise<T & { id: string }> {
  const { data } = await http.get<JsonApiSingle<T>>(path);
  return flatten(data.data);
}

export async function postOne<T extends object>(path: string): Promise<T & { id: string }> {
  const { data } = await http.post<JsonApiSingle<T>>(path);
  return flatten(data.data);
}
