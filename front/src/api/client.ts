import axios from "axios";

export const http = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || "http://localhost:3000/api/v1",
  headers: { Accept: "application/vnd.api+json, application/json" },
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
