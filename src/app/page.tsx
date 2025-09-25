export default function Page() {
  return (
    <div className="flex min-h-screen">
  {/* card vertical dreptunghi */}
  <div className="w-60 bg-[var(--color-card)] border-r border-[var(--color-border)] flex flex-col justify-between py-10 h-screen">
    {/* Partea de sus */}
    <div className="flex flex-col items-center"> SR LOGO bla bla
      {/* Dashboard btn */}
      <button className="w-48 py-3 bg-[var(--color-secondary)] text-white font-semibold rounded mb-4 hover:bg-[var(--color-accent)] transition">
        Dashboard
      </button>
    </div>

    {/* Elementul de jos */}
    <div className="flex justify-center text-white">
      Sr solutions
    </div>
  </div>

      {/* landing page*/}
      <div className="flex-1 flex flex-col items-center justify-center bg-[var(--color-background)]">
        <h1 className="text-4xl font-bold mb-4 text-[var(--color-foreground)]">
          Landing page!!!
        </h1>
        <p className="text-lg text-[var(--color-card)]">Home sweet home</p>
       
      </div>
    </div>
  );
}
