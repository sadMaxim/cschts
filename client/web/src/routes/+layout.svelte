<script>
  import '../app.css';
  import { onMount, onDestroy } from 'svelte';
  
  // Mobile menu toggle functionality
  let mobileMenuOpen = false;
  let mobileMenuToggle;
  
  function toggleMobileMenu() {
    const mobileMenu = document.querySelector('.mobile-menu');
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    
    mobileMenuOpen = !mobileMenuOpen;
    
    if (mobileMenuOpen) {
      mobileMenu.classList.add('open');
      mobileMenuToggle.classList.add('open');
      mobileMenuToggle.setAttribute('aria-expanded', 'true');
    } else {
      mobileMenu.classList.remove('open');
      mobileMenuToggle.classList.remove('open');
      mobileMenuToggle.setAttribute('aria-expanded', 'false');
    }
  }
  
  function setupMobileMenu() {
    mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    if (mobileMenuToggle) {
      mobileMenuToggle.addEventListener('click', toggleMobileMenu);
    }
  }
  
  onMount(() => {
    setupMobileMenu();
  });
  
  onDestroy(() => {
    if (mobileMenuToggle) {
      mobileMenuToggle.removeEventListener('click', toggleMobileMenu);
    }
  });
</script>

<div class="app">
  <header>
    <div class="container">
      <div class="logo">
        <a href="/">FairPlay CS2</a>
      </div>
      <nav class="desktop-nav">
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/leaderboards">Leaderboards</a></li>
          <li><a href="/stats">Stats</a></li>
          <li><a href="/weapons">Weapons</a></li>
          <li><a href="/maps">Maps</a></li>
        </ul>
      </nav>
      <div class="search-container">
        <input type="text" placeholder="Search players..." />
        <button type="submit" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
          </svg>
        </button>
      </div>
      <button class="mobile-menu-toggle" aria-label="Toggle mobile menu" aria-expanded="false">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>
  </header>

  <div class="mobile-menu">
    <nav>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/leaderboards">Leaderboards</a></li>
        <li><a href="/stats">Stats</a></li>
        <li><a href="/weapons">Weapons</a></li>
        <li><a href="/maps">Maps</a></li>
      </ul>
    </nav>
  </div>

  <main>
    <slot />
  </main>

  <footer>
    <div class="container">
      <div class="footer-content">
        <div class="footer-section">
          <h3>CS2 Tracker</h3>
          <p>Track your CS2 stats and compare with others</p>
        </div>
        <div class="footer-section">
          <h3>Links</h3>
          <ul>
            <li><a href="/about">About</a></li>
            <li><a href="/privacy">Privacy Policy</a></li>
            <li><a href="/terms">Terms of Service</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h3>Connect</h3>
          <div class="social-links">
            <a href="https://twitter.com" aria-label="Twitter">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z"></path>
              </svg>
            </a>
            <a href="https://discord.com" aria-label="Discord">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M18 9a5 5 0 0 0-5-5H5a5 5 0 0 0-5 5v6a5 5 0 0 0 5 5h8a5 5 0 0 0 5-5V9z"></path>
                <path d="M12 12v.01"></path>
                <path d="M8 12v.01"></path>
                <path d="M16 12v.01"></path>
              </svg>
            </a>
          </div>
        </div>
      </div>
      <div class="copyright">
        <p>&copy; 2025 CS2 Tracker. All rights reserved.</p>
      </div>
    </div>
  </footer>
</div>


