package villagemarker;

import java.awt.Color;

import org.lwjgl.opengl.GL11;

public class RenderShapes 
{
	static boolean gl_lighting;
	static boolean gl_texture_2d;
	static boolean gl_point_smooth;
	static boolean gl_line_smooth;
	static boolean gl_depth_test;
	static boolean gl_blend;
	static float gl_point_size;
	static float gl_line_width;
	static int gl_blend_src;
	static int gl_blend_dst;

	
    public static void translate(float x, float y, float z) 
    {
        GL11.glTranslatef(-x, -y, -z);
    }

    private static void setGLConst(int glconst, boolean value)
    {
        if(value)
        	GL11.glEnable(glconst);
        else
        	GL11.glDisable(glconst);
    }
    
    public static void setup(boolean doDepth) 
    {
        GL11.glPushMatrix();
        
        gl_point_size = GL11.glGetFloat(GL11.GL_POINT_SIZE);
        gl_line_width = GL11.glGetFloat(GL11.GL_LINE_WIDTH);
        gl_lighting = GL11.glGetBoolean(GL11.GL_LIGHTING);
        gl_texture_2d = GL11.glGetBoolean(GL11.GL_TEXTURE_2D);
        gl_point_smooth = GL11.glGetBoolean(GL11.GL_POINT_SMOOTH);
        gl_line_smooth = GL11.glGetBoolean(GL11.GL_LINE_SMOOTH);
        gl_blend = GL11.glGetBoolean(GL11.GL_BLEND);
        gl_depth_test = GL11.glGetBoolean(GL11.GL_DEPTH_TEST);
        
        gl_blend_src = GL11.glGetInteger(GL11.GL_BLEND_SRC);
        gl_blend_dst = GL11.glGetInteger(GL11.GL_BLEND_DST);
        
        GL11.glDisable(GL11.GL_LIGHTING);
        GL11.glDisable(GL11.GL_TEXTURE_2D);
        GL11.glEnable(GL11.GL_POINT_SMOOTH);
        GL11.glEnable(GL11.GL_LINE_SMOOTH);
        GL11.glHint(GL11.GL_POINT_SMOOTH_HINT, GL11.GL_NICEST);
        GL11.glHint(GL11.GL_LINE_SMOOTH_HINT, GL11.GL_NICEST);
        GL11.glDisable(GL11.GL_BLEND);
        setGLConst(GL11.GL_DEPTH_TEST, doDepth);
    }
    
    public static void restore() 
    {
    	setGLConst(GL11.GL_LIGHTING, gl_lighting);
    	setGLConst(GL11.GL_TEXTURE_2D, gl_texture_2d);
    	setGLConst(GL11.GL_POINT_SMOOTH, gl_point_smooth);
    	setGLConst(GL11.GL_LINE_SMOOTH, gl_line_smooth);
    	setGLConst(GL11.GL_DEPTH_TEST, gl_depth_test);
    	setGLConst(GL11.GL_BLEND, gl_blend);
    	
    	GL11.glBlendFunc(gl_blend_src, gl_blend_dst);
    	
        GL11.glLineWidth(gl_line_width);
        GL11.glPointSize(gl_point_size);
        GL11.glPopMatrix();
    }
    
    public static void drawLine(float startx, float starty, float startz, float endx, float endy, float endz, Color color, float width) 
    {
    	GL11.glColor3f(color.getRed()/255.0F, color.getGreen()/255.0F, color.getBlue()/255.0F);
        GL11.glLineWidth(width);
        GL11.glBegin(GL11.GL_LINE_STRIP);
         GL11.glVertex3f(startx, starty, startz);
         GL11.glVertex3f(endx, endy, endz);
        GL11.glEnd();
    }

    public static void drawBox(float ax, float ay, float az, float bx, float by, float bz, Color color, float width)
    {
    	GL11.glColor3f(color.getRed()/255.0F, color.getGreen()/255.0F, color.getBlue()/255.0F);
        GL11.glLineWidth(width);
        
        GL11.glBegin(GL11.GL_LINE_STRIP);
         GL11.glVertex3f(ax, ay, bz);
         GL11.glVertex3f(bx, ay, bz);
         GL11.glVertex3f(bx, ay, az);
         GL11.glVertex3f(ax, ay, az);
         GL11.glVertex3f(ax, ay, bz);
        GL11.glEnd();
        GL11.glBegin(GL11.GL_LINE_STRIP);
         GL11.glVertex3f(ax, by, bz);
         GL11.glVertex3f(bx, by, bz);
         GL11.glVertex3f(bx, by, az);
         GL11.glVertex3f(ax, by, az);
         GL11.glVertex3f(ax, by, bz);
        GL11.glEnd();
        GL11.glBegin(GL11.GL_LINES);
         GL11.glVertex3f(ax, ay, bz);
         GL11.glVertex3f(ax, by, bz);
        GL11.glEnd();
        GL11.glBegin(GL11.GL_LINES);
         GL11.glVertex3f(bx, ay, bz);
         GL11.glVertex3f(bx, by, bz);
        GL11.glEnd();
        GL11.glBegin(GL11.GL_LINES);
         GL11.glVertex3f(bx, ay, az);
         GL11.glVertex3f(bx, by, az);
        GL11.glEnd();
        GL11.glBegin(GL11.GL_LINES);
         GL11.glVertex3f(ax, ay, az);
         GL11.glVertex3f(ax, by, az);
        GL11.glEnd();
    }
   
    private static void drawBoxPart(float args[][], int m[][])
    {
    	GL11.glBegin(GL11.GL_QUADS);
    	for(int i = 0; i < m.length; i++)
   			GL11.glVertex3f(args[m[i][0]][0], args[m[i][1]][1], args[m[i][2]][2]);
    	GL11.glEnd();
    }
    
    public static void drawBoxWalls(float ax, float ay, float az, float bx, float by, float bz, Color color, float alpha)
    {
	    GL11.glEnable(GL11.GL_BLEND);
	    GL11.glBlendFunc(GL11.GL_SRC_ALPHA, GL11.GL_ONE);
	    GL11.glDepthMask(false);
	    GL11.glColor4f(color.getRed()/255.0F, color.getGreen()/255.0F, color.getBlue()/255.0F, alpha);
	    
	    float args[][] = new float[][] { {ax,ay,az}, {bx,by,bz} };
	    
	    // Outside
	    drawBoxPart(args, new int[][] {{0,0,0},{0,0,1},{0,1,1},{0,1,0}}); // Neg X
	    drawBoxPart(args, new int[][] {{1,0,0},{1,1,0},{1,1,1},{1,0,1}}); // Pos X
	    
	    drawBoxPart(args, new int[][] {{0,0,0},{1,0,0},{1,0,1},{0,0,1}}); // Neg Y
	    drawBoxPart(args, new int[][] {{0,1,0},{0,1,1},{1,1,1},{1,1,0}}); // Pos Y
	    
	    drawBoxPart(args, new int[][] {{0,0,0},{0,1,0},{1,1,0},{1,0,0}}); // Neg Z
	    drawBoxPart(args, new int[][] {{0,0,1},{1,0,1},{1,1,1},{0,1,1}}); // Pos Z
	    
	    // Inside
	    drawBoxPart(args, new int[][] {{0,0,0},{0,1,0},{0,1,1},{0,0,1}}); // Neg X
	    drawBoxPart(args, new int[][] {{1,0,0},{1,0,1},{1,1,1},{1,1,0}}); // Pos X
	    
	    drawBoxPart(args, new int[][] {{0,0,0},{0,0,1},{1,0,1},{1,0,0}}); // Neg Y
	    drawBoxPart(args, new int[][] {{0,1,0},{1,1,0},{1,1,1},{0,1,1}}); // Pos Y
	    
	    drawBoxPart(args, new int[][] {{0,0,0},{1,0,0},{1,1,0},{0,1,0}}); // Neg Z
	    drawBoxPart(args, new int[][] {{0,0,1},{0,1,1},{1,1,1},{1,0,1}}); // Pos Z
	    
	    GL11.glDepthMask(true);
	    GL11.glBlendFunc(GL11.GL_ONE, GL11.GL_ZERO);
	    GL11.glDisable(GL11.GL_BLEND);
    }
    
    public static void drawSphere(float cx, float cy, float cz, double rad, int sphereSegments, Color color, float width) 
    {
    	GL11.glColor3f(color.getRed()/255.0F, color.getGreen()/255.0F, color.getBlue()/255.0F);
        GL11.glPointSize(width);
        
        final double dPhi = 2*Math.PI / sphereSegments;
        
        for(double phi = 0.0; phi < 2*Math.PI; phi += dPhi)
        {
        	double sinPhi = Math.sin(phi);
        	double dTheta = Math.PI / (1 + (int)(sphereSegments * Math.abs(sinPhi/2)));
        	GL11.glBegin(GL11.GL_POINTS);
            for(double theta = 0.0; theta < Math.PI; theta += dTheta)
            {
                float dx = (float)(rad * sinPhi * Math.cos(theta));
                float dz = (float)(rad * sinPhi * Math.sin(theta));
                float dy = (float)(rad * Math.cos(phi));
                GL11.glVertex3f(cx+dx, cy+dy, cz+dz);
            }
            GL11.glEnd();
        }
    }
    
    public static float sphereBufDVec[][];
    
    public static void updateSphereBuf(int sphereSegments)
    {
    	float dvec[][] = new float[1+(int)(sphereSegments*sphereSegments*Math.PI/4.0)][];
    	int dveclen = 0;
    	
        double dPhi = 2*Math.PI / sphereSegments;
        
        for(double phi = 0.0; phi < 2*Math.PI; phi += dPhi)
        {
        	double sinPhi = Math.sin(phi);
        	double dTheta = Math.PI / (1 + (int)(sphereSegments * Math.abs(sinPhi/2)));
            for(double theta = 0.0; theta < Math.PI; theta += dTheta)
            {
                float dx = (float)(sinPhi * Math.cos(theta));
                float dz = (float)(sinPhi * Math.sin(theta));
                float dy = (float)(Math.cos(phi));
                dvec[dveclen++] = new float[] {dx,dy,dz};
            }
        }
        
        sphereBufDVec = new float[dveclen][];
        for(int i = 0; i < dveclen; i++)
        	sphereBufDVec[i] = dvec[i];
    }
    
    public static void drawBufferedSphere(float cx, float cy, float cz, float rad, Color color, float width)
    {
    	GL11.glColor3f(color.getRed()/255.0F, color.getGreen()/255.0F, color.getBlue()/255.0F);
        GL11.glPointSize(width);
        
        int cnt = 0;
        GL11.glBegin(GL11.GL_POINTS);
        for(float unitvec[] : sphereBufDVec)
        {
        	GL11.glVertex3f(cx+unitvec[0]*rad, cy+unitvec[1]*rad, cz+unitvec[2]*rad);
        }
        GL11.glEnd();
    }
}
