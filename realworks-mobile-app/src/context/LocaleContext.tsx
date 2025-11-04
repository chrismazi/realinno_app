import React, { createContext, useContext, useState, ReactNode } from 'react';
import { locales, LocaleKey } from '../locales';

interface LocaleContextType {
  locale: 'rw' | 'en';
  setLocale: (locale: 'rw' | 'en') => void;
  t: (key: LocaleKey) => string;
}

const LocaleContext = createContext<LocaleContextType | undefined>(undefined);

export const LocaleProvider = ({ children }: { children: ReactNode }) => {
  const [locale, setLocale] = useState<'rw' | 'en'>('rw'); // Default to Kinyarwanda
  const t = (key: LocaleKey) => locales[locale][key] || key;
  return (
    <LocaleContext.Provider value={{ locale, setLocale, t }}>
      {children}
    </LocaleContext.Provider>
  );
};

export const useLocale = () => {
  const ctx = useContext(LocaleContext);
  if (!ctx) throw new Error('useLocale must be used within LocaleProvider');
  return ctx;
};
