import React from "react";

export default function Layout({ children }: { children: React.ReactNode }) {
  return <div className="p-8 max-w-3xl mx-auto">{children}</div>;
}