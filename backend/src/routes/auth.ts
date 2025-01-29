import { Request, Response, Router } from "express";
import { db } from "../db";
import { NewUser, users } from "../db/schema";
import { eq } from "drizzle-orm";
import bcryptjs from "bcryptjs";

const authRouter = Router();

interface SignUpBody {
    name: string;
    email: string;
    password: string;
}

authRouter.post("/signup", async (req: Request<{}, {}, SignUpBody>, res: Response) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await db.select().from(users).where(eq(users.email, email));

        if (existingUser.length > 0) {
            res.status(400).json({ error: "User already exists" });
            return;
        }

        const hashedPassword = await bcryptjs.hash(password, 8);

        const newUser: NewUser = {
            name,
            email,
            password: hashedPassword,
        };

        const [user] = await db.insert(users).values(newUser).returning();

        res.status(201).json(user);
    } catch (e) {
        res.status(500).json({ error: e });
    }
})

authRouter.get("/", (req, res) => {
    res.send("Auth");
});

export default authRouter;