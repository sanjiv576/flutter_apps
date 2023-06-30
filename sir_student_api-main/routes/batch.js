const express = require("express");
const router = express.Router();
const { protect } = require("../middleware/auth");

const {
  getBatches,
  getBatch,
  createBatch,
  updateBatch,
  deleteBatch,
} = require("../controllers/batch");

router.get("/getAllBatches", getBatches);
router.get("/:id", getBatch);

router.post("/createBatch", createBatch);
router.put("/:id", protect, updateBatch);
router.delete("/:id", protect, deleteBatch);

module.exports = router;
