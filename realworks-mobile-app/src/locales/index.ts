import rw from './rw';
import en from './en';

export const locales = { rw, en };
export type LocaleKey = keyof typeof rw;
