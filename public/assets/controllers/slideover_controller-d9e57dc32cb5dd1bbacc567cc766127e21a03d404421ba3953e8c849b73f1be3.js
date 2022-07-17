import { Controller } from "@hotwired/stimulus";
import { Slideover } from "tailwindcss-stimulus-components";

export default class extends Slideover {
  static targets = ["overlay"];

  connect() {
    super.connect();
  }
};
