---
layout: single
title: "Moments"
permalink: /moments/
author_profile: true
toc: false
classes: wide
---

<link rel="stylesheet" href="{{ '/assets/css/moments.css' | relative_url }}">

<div class="moments-container">
  <div class="moments-header">
    <h1>📸 生活片段</h1>
    <p>记录生活中的美好瞬间</p>
  </div>
  
  <div class="moments-timeline">
    {% assign sorted_moments = site.moments | sort: 'date' | reverse %}
    {% for moment in sorted_moments %}
    <div class="moment-item" data-date="{{ moment.date | date: '%Y-%m-%d' }}">
      <div class="moment-date-column">
        <div class="moment-date">{{ moment.date | date: "%b %-d" }}</div>
        <div class="moment-year">{{ moment.date | date: "%Y" }}</div>
      </div>
      
      <div class="moment-entry">
        <div class="moment-avatar">
          <img src="{{ '/assets/images/avatar-moments.jpg' | relative_url }}" alt="Jiacheng">
        </div>
        
        <div class="moment-content">
          <div class="moment-header">
            <span class="moment-author">Jiacheng</span>
            {% if moment.tags %}
            {% assign valid_tags = "" | split: "," %}
            {% for tag in moment.tags %}
              {% if tag and tag != "" and tag != " " %}
                {% assign valid_tags = valid_tags | push: tag %}
              {% endif %}
            {% endfor %}
            
            {% if valid_tags.size > 0 %}
            <div class="moment-tags">
              {% for tag in valid_tags %}
              <span class="moment-tag">#{{ tag }}</span>
              {% endfor %}
            </div>
            {% endif %}
            {% endif %}
          </div>
          
          {% if moment.content and moment.content != empty %}
          <div class="moment-text">
            {{ moment.content | markdownify }}
          </div>
          {% endif %}
          
          {% if moment.pictures %}
          {% assign valid_pictures = "" | split: "," %}
          {% for image in moment.pictures %}
            {% if image and image != "" and image != " " %}
              {% assign valid_pictures = valid_pictures | push: image %}
            {% endif %}
          {% endfor %}
          
          {% if valid_pictures.size > 0 %}
          <div class="moment-images {% if valid_pictures.size == 1 %}single-image{% elsif valid_pictures.size <= 3 %}few-images{% else %}many-images{% endif %}" data-images="{{ valid_pictures | jsonify | escape }}">
            {% for image in valid_pictures %}
            <div class="moment-image" data-index="{{ forloop.index0 }}" data-src="{{ image | relative_url }}">
              <img src="{{ image | relative_url }}" alt="Moment image" loading="lazy">
            </div>
            {% endfor %}
          </div>
          {% endif %}
          {% endif %}
          
          {% if moment.link %}
          <div class="moment-link">
            <a href="{{ moment.link.url }}" target="_blank" rel="noopener">
              <div class="link-preview">
                {% if moment.link.image %}
                <img src="{{ moment.link.image }}" alt="Link preview">
                {% endif %}
                <div class="link-info">
                  <h4>{{ moment.link.title }}</h4>
                  {% if moment.link.description %}
                  <p>{{ moment.link.description }}</p>
                  {% endif %}
                </div>
              </div>
            </a>
          </div>
          {% endif %}
          
          <div class="moment-time">{{ moment.date | date: "%H:%M" }}{% if moment.note and moment.note != empty %} {{ moment.note }}{% endif %}</div>
        </div>
      </div>
    </div>
    {% endfor %}
    
    {% if site.moments.size == 0 %}
    <div class="no-moments">
      <p>还没有任何 moments，开始记录你的生活吧！</p>
    </div>
    {% endif %}
  </div>
</div>

<!-- Image Modal -->
<div id="imageModal" class="image-modal">
  <span class="modal-close" onclick="closeImageModal()">&times;</span>
  <img class="modal-content" id="modalImage">
  <div class="modal-nav">
    <button id="prevBtn" onclick="changeImage(-1)">‹</button>
    <button id="nextBtn" onclick="changeImage(1)">›</button>
  </div>
  <div class="modal-counter">
    <span id="imageCounter"></span>
  </div>
</div>

<script>
let currentImageIndex = 0;
let currentImages = [];

// Initialize image click handlers when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
  // Add click handlers to all moment images
  document.querySelectorAll('.moment-image').forEach(function(imageDiv) {
    imageDiv.addEventListener('click', function() {
      const imageSrc = this.getAttribute('data-src');
      const index = parseInt(this.getAttribute('data-index'));
      const imagesContainer = this.closest('.moment-images');
      const imagesJson = imagesContainer.getAttribute('data-images');
      const images = JSON.parse(imagesJson);
      
      openImageModal(imageSrc, index, images);
    });
  });
});

function openImageModal(imageSrc, index, images) {
  currentImageIndex = parseInt(index);
  currentImages = images;
  
  const modal = document.getElementById('imageModal');
  const modalImg = document.getElementById('modalImage');
  const counter = document.getElementById('imageCounter');
  
  modal.style.display = 'block';
  modalImg.src = imageSrc;
  
  updateImageCounter();
  updateNavButtons();
}

function closeImageModal() {
  document.getElementById('imageModal').style.display = 'none';
}

function changeImage(direction) {
  currentImageIndex += direction;
  
  if (currentImageIndex >= currentImages.length) {
    currentImageIndex = 0;
  } else if (currentImageIndex < 0) {
    currentImageIndex = currentImages.length - 1;
  }
  
  const modalImg = document.getElementById('modalImage');
  modalImg.src = currentImages[currentImageIndex];
  
  updateImageCounter();
}

function updateImageCounter() {
  const counter = document.getElementById('imageCounter');
  counter.textContent = `${currentImageIndex + 1} / ${currentImages.length}`;
}

function updateNavButtons() {
  const prevBtn = document.getElementById('prevBtn');
  const nextBtn = document.getElementById('nextBtn');
  
  if (currentImages.length <= 1) {
    prevBtn.style.display = 'none';
    nextBtn.style.display = 'none';
  } else {
    prevBtn.style.display = 'block';
    nextBtn.style.display = 'block';
  }
}

// Close modal when clicking outside of image
window.onclick = function(event) {
  const modal = document.getElementById('imageModal');
  if (event.target == modal) {
    closeImageModal();
  }
}

// Keyboard navigation
document.addEventListener('keydown', function(event) {
  const modal = document.getElementById('imageModal');
  if (modal.style.display === 'block') {
    switch(event.key) {
      case 'Escape':
        closeImageModal();
        break;
      case 'ArrowLeft':
        changeImage(-1);
        break;
      case 'ArrowRight':
        changeImage(1);
        break;
    }
  }
});
</script>