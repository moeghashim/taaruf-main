import Image from "next/image";

const highlights = [
	"A thoughtful space for Muslims to meet",
	"Built around clarity, respect, and intention",
	"Launching soon",
];

export default function HomePage() {
	return (
		<main className="page-shell">
			<section className="hero">
				<div className="logo-wrap">
					<Image
						src="/taaruf-logo.jpg"
						alt="Taaruf logo"
						width={280}
						height={280}
						priority
						className="hero-logo"
					/>
				</div>
				<p className="eyebrow">Taaruf</p>
				<h1>Build bridges between Muslims to meet.</h1>
				<p className="hero-copy">
					We’re creating a warm, respectful space that helps Muslims connect with intention.
					Our website is currently being prepared and will be launching soon.
				</p>
				<div className="pill-row" aria-label="Project highlights">
					{highlights.map((item) => (
						<span className="info-pill" key={item}>
							{item}
						</span>
					))}
				</div>
			</section>
		</main>
	);
}
